local events = defines.events
local built = { events.on_built_entity, events.on_robot_built_entity }
local function handle_placement_built(event)
    local entity = event.created_entity or event.entity
    local surface = entity.surface

    if not entity or not entity.valid then return end

    if (surface.name ~= "nauvis") and entity.valid and (entity.name == "utopia-portal") then
        entity.active = false
        entity.operable = false
        return
    end
    if (surface.name == "nauvis") and entity.valid and (entity.name == "utopia-portal") then

        if (global.computers == nil) then 
            global.computers = {}
        end
        global.computers[entity.unit_number] = {["status"] = 0, ["surface"] = nil, ["seed"] = "", ["actual"] = entity, ["corresponding"] = nil}
        return
    end

    -- Handling ports
    if entity.valid and entity.name == "portal-port" then
        if (global.computers == nil) then 
            return
        end
        global.computers[entity.unit_number] = {["status"] = 0, ["surface"] = "nauvis", ["seed"] = "", ["actual"] = entity, ["corresponding"] = nil}
        return
    end

    -- Handling one-time-pads
    if (surface.name ~= "nauvis") and entity.valid and entity.name == "one-time-pad" then
        entity.active = false
        entity.operable = false
        return
    end
    if (surface.name == "nauvis") and entity.valid and entity.name == "one-time-pad" then
        if (global.computers == nil) then 
            global.computers = {}
        end
        global.computers[entity.unit_number] = {["status"] = 0, ["surface"] = nil, ["seed"] = "", ["actual"] = entity, ["corresponding"] = nil}
        local gen_settings = game.surfaces[1].map_gen_settings
        gen_settings.autoplace_controls = {
            ["data-leak"] = {frequency = 0, size = 0},
            ["bit-ore"] = {frequency = 0, size = 0},
            ["simulation-error-ore"] = {frequency = 0, size = 0},
            ["pointer-ore"] = {frequency = 0, size = 0},
            ["iron-ore"] = {frequency = 1, size = 0.17, richness = 0.05},
            ["copper-ore"] = {frequency = 1, size = 0.17, richness = 0.05},
            ["stone"] = {frequency = 1, size = 0.17, richness = 0.05},
            ["coal"] = {frequency = 1, size = 0.17, richness = 0.05}, 
            ["uranium-ore"] = {frequency = 1, size = 0.17, richness = 0.05},
            ["crude-oil"] = {frequency = 5, size = 0.17, richness = 0.17},
            ["enemy-base"] = {frequency = 3, size = 1}
        }
        gen_settings.starting_area = 0
        gen_settings.width = 200
        gen_settings.height = 200
        entity.insert("harddrive-dummy")
        entity.energy = 20

        if global.computers[entity.unit_number] then
            global.computers[entity.unit_number]["seed"] = "00000000"
            
            gen_settings.seed = 0

            local new_surface = game.create_surface(tostring(entity.unit_number), gen_settings)
            -- new_surface.request_to_generate_chunks({0, 0}, 1)
            local corresponding = new_surface.create_entity{name = "simulacrum-port", position = {0, 0}, force = "player"}
            corresponding.operable = false
            corresponding.minable = false
            global.computers[corresponding.unit_number]["corresponding"] = entity --NOT WORKING
            global.computers[entity.unit_number]["corresponding"] = corresponding
            global.computers[entity.unit_number]["surface"] = new_surface.name
            global.computers[entity.unit_number]["status"] = 1
        end
        return
    end
end

local function computer_destroyed(event)
    if event.entity.valid and (event.entity.name == "simulacrum-port" or event.entity.name == "simulacrum-computer-1" or event.entity.name == "simulacrum-computer-2" or event.entity.name == "simulacrum-computer-3" or event.entity.name == "simulacrum-computer-4" or event.entity.name == "one-time-pad") then
        if global.computers and global.computers[event.entity.unit_number] then 
            if event.entity.name == "simulacrum-port" then
                check_computer_status()
                return
            end
            if global.computers[event.entity.unit_number].surface then game.delete_surface(global.computers[event.entity.unit_number]["surface"]) end
            local port = global.computers[event.entity.unit_number].corresponding
            if port and port.valid and event.entity.name ~= "simulacrum-port" then
                global.computers[port.unit_number] = nil
            end
            global.computers[event.entity.unit_number] = nil
        end
    elseif event.entity.valid and event.entity.name == "quantum-chest" then
        if global.quantum_chests and global.quantum_chests[event.entity.unit_number] then
            local surface = global.quantum_chests[event.entity.unit_number]
            global.quantum_chests[event.entity.unit_number] = nil
            global.quantum_chests[surface] = nil
        end
    end
end

script.on_event(built, handle_placement_built)
script.on_event(events.on_entity_died, computer_destroyed)
script.on_event(events.on_player_mined_entity, computer_destroyed)
script.on_event(events.on_robot_mined_entity, computer_destroyed)
script.on_event(events.script_raised_built , handle_placement_built)

script.on_event('quantum-chest-filter', function(event)
    local player = game.get_player(event.player_index)
    if player.selected and player.selected.name == 'quantum-chest' and player.selected.get_inventory(defines.inventory.chest).get_filter(1) then
        player.print('[item=' .. player.selected.get_inventory(defines.inventory.chest).get_filter(1) .. ']')
    end
end)

require("worldgen/evalpattern")
require("worldgen/lib/rand")
require("util")

local get_tile = nil
local force_initial_water = false

local function make_chunk(event) 
    local surface = event.surface
    if surface.name ~= "nauvis" then return end

    local gt = get_tile
    local tinsert = table.insert

    local x1 = event.area.left_top.x
    local y1 = event.area.left_top.y
    local x2 = event.area.right_bottom.x
    local y2 = event.area.right_bottom.y

    event.surface.destroy_decoratives(event.area)

    local ore = event.surface.find_entities_filtered{type='resource', area = event.area}
    for o=1,#ore do 
        if (ore[o].name == 'coal' or ore[o].name == 'iron-ore' or ore[o].name == 'copper-ore' or ore[o].name == 'stone' or ore[o].name == 'uranium-ore' or ore[o].name == 'crude-oil') then
            ore[o].destroy()
        end
    end  

    local repltable = 
    {
        "virtual-stone-huge",
        "virtual-stone-big"
    }

    for k, entity in pairs(event.surface.find_entities_filtered{area = event.area}) do
        if string.match(entity.name, "rock") then
            local replacement = repltable[ math.random( #repltable ) ]
            local dir, pos, player, force, surface
            dir = entity.direction
            pos = entity.position
            force = entity.force
            entity.destroy()
            replace = event.surface.create_entity {
                name = replacement,
                position = pos,
                direction = dir,
                force = force,
            }
        end
    end

    repltable = 
    {
        "virtual-wood-1",
        "virtual-wood-2",
        "virtual-wood-3",
        "virtual-wood-4",
        "virtual-wood-5"
    }

    for k, entity in pairs(event.surface.find_entities_filtered{area = event.area}) do
        if string.match(entity.name, "tree") then
            local replacement = repltable[ math.random( #repltable ) ]
            local dir, pos, player, force, surface
            dir = entity.direction
            pos = entity.position
            force = entity.force
            entity.destroy()
            replace = event.surface.create_entity {
                name = replacement,
                position = pos,
                direction = dir,
                force = force,
            }
        end
    end

    tiles = {}

    if math.abs(x1) + math.abs(y1) > 70 then
        for x = x1, x2 do
            for y = y1, y2 do
                local new = gt(x, y)
                if new ~= nil then
                    tinsert(tiles, {name = new, position = {x, y}})
                
            else 
                table.insert(tiles, {name = "virtual-concrete", position = {x,y}})
            end
            end
        end

    else
        for x = x1, x2 do
            for y = y1, y2 do
        
                    if (x * x + y * y > 5) then
                        local new = gt(x, y)
                        if new ~= nil then
                            tinsert(tiles, {name = new, position = {x, y}})
                        
                    else 
                        table.insert(tiles, {name = "virtual-concrete", position = {x,y}})
                    end
                    end
            end
        end
    end
    surface.set_tiles(tiles)
end

local function on_init(event)
    --for i, player in pairs(game.players) do
    --    create_gui(player.index)
    --end
    init_global_rng(0)
    
    force_initial_water = false
    local tp = evaluate_pattern()
    global.tp_data = tp.create()
    get_tile = tp.get
    script.on_event(defines.events.on_chunk_generated, make_chunk)

    game.surfaces[1].solar_power_multiplier = 0
    game.surfaces[1].show_clouds = false

    if script.level.level_name == "freeplay" then
        remote.call("freeplay", "set_disable_crashsite", true)
    end
end 

local function on_load(event)
    force_initial_water = false
    local tp = evaluate_pattern()
    tp.reload(global.tp_data)
    get_tile = tp.get
    script.on_event(defines.events.on_chunk_generated, make_chunk)
end

script.on_init(on_init)
script.on_load(on_load)