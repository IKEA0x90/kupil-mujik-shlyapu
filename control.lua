
local events = defines.events
local built = { events.on_built_entity, events.on_robot_built_entity }
Event = require('__space-exploration__/scripts/event')

function is_alive(entity)
    return (entity.name == "dead-converter") or (entity.name == "brr") --or (entity.name == "living-wall")
end

script.on_event(events.on_player_placed_equipment, function(event)

	local player = game.players[event.player_index]
    if event.equipment.name == "lubricant-fish-equipment" then
		player.character_crafting_speed_modifier = player.character_crafting_speed_modifier + 0.1
    end
    
    if event.equipment.name == "head-crab" then
		player.character_crafting_speed_modifier = player.character_crafting_speed_modifier + 5
        player.character_inventory_slots_bonus = player.character_inventory_slots_bonus + 20
        player.character_running_speed_modifier = player.character_running_speed_modifier + 4
    end

end)

script.on_event(events.on_player_removed_equipment, function(event)
 	local player = game.players[event.player_index]

    if player and player.character then

        if event.equipment == "lubricant-fish-equipment" then
            if event.count >= 0 then
                local crafting = player.character_crafting_speed_modifier - (0.1 * event.count)
                
                if crafting >= 0 then
                    player.character_crafting_speed_modifier = crafting
                end
            end
        end

        if event.equipment == "head-crab" then
            if event.count >= 0 then
                local crafting = player.character_crafting_speed_modifier - (5 * event.count)
                local inventory = player.character_inventory_slots_bonus - (20 * event.count)
                local speed = player.character_running_speed_modifier - (4 * event.count)
            
                if crafting >= 0 then
                player.character_crafting_speed_modifier = crafting
                end
                if inventory > 0 then
                    player.character_inventory_slots_bonus = inventory
                end
                if speed > 0 then
                    player.character_running_speed_modifier = speed
                end

                die_player(player) 

            end
        end
    end
end)

script.on_event(defines.events.on_player_armor_inventory_changed, function(event)
    local player = game.players[event.player_index]
	local armor = player.get_inventory(defines.inventory.character_armor)
	
	if not armor.is_empty() then
		
		local total_crafting = 0
		local total_inventory = 0
        local total_speed = 0
				
		local grid = armor[1].grid

		if grid ~= nil then

			for i = 1, #grid.equipment do
                if grid.equipment[i].name == "lubricant-fish-equipment" then
                    total_crafting = total_crafting + 0.1
                end
                if grid.equipment[i].name == "head-crab" then
                    total_crafting = total_crafting + 5
                    total_speed = total_speed + 4
                    total_inventory = total_inventory + 20
                end
			end

			set_inventory_local(player.character_crafting_speed_modifier, total_crafting)
            set_inventory_local(player.character_inventory_slots_bonus, total_inventory)	
            set_inventory_local(player.character_running_speed_modifier, total_speed)
		else
			clear_all_bonuses(player)			
		end	
	else
		clear_all_bonuses(player)
	end
end)

function set_inventory_local(modifier, count)
    modifier = count
end

function clear_all_bonuses(player)
	player.character_crafting_speed_modifier = 0
    player.character_inventory_slots_bonus = 0
    player.character_running_speed_modifier = 0
end

function die_player(player)
    local surface = player.character.surface
    local position_dead = player.character.position
    local armor = player.get_inventory(defines.inventory.character_armor)
    local inventory = player.get_inventory(defines.inventory.character_main)

    if armor and not armor.is_empty() then
        local grid = armor[1].grid
        local total_crabs = 0

        for i = 1, #grid.equipment do
            if grid.equipment[i].name == "head-crab" then
                total_crabs = total_crabs + 1
            end
        end

        if total_crabs > 0 then
            grid.clear()
            player.remove_item{name="head-crab", count=total_crabs}
        end
    end

    local contains = inventory.find_item_stack("head-crab")

    if contains then
        player.remove_item{name="head-crab", count=1}
    end

    player.character.die()

    surface.create_entity{name = "dead-converter", position = position_dead, force = game.forces.player}

end

local function handle_placement_built(event)
    local entity = event.created_entity
    if not entity or not entity.valid then return end
    if is_alive(entity) then
        if (global.living == nil) then 
            global.living = {}
        end
        table.insert(global.living, entity)
    end
end

function heal_wall()
	if global.living then 
		for i, entity in pairs(global.living) do
			if entity and entity.valid then
                if (entity.health) and (entity.health <= entity.prototype.max_health) then
                    entity.health = entity.health + 360
                end
            else
                table.remove(global.living, i)
            end
        end
    end
end

Event.addListener(defines.events.on_built_entity, handle_placement_built)
Event.addListener(defines.events.on_robot_built_entity, handle_placement_built)
Event.addListener(defines.events.script_raised_built, handle_placement_built)
Event.addListener(defines.events.script_raised_revive, handle_placement_built)
script.on_nth_tick(3600, heal_wall)

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end