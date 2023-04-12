require("prototypes/utopia/portal-control.lua")

local events = defines.events
local built = { events.on_built_entity, events.on_robot_built_entity }
Event = require('__space-exploration__/scripts/event')

script.on_event(events.on_player_placed_equipment, function(event)

	local player = game.players[event.player_index]
    if event.equipment.name == "lubricant-fish-equipment" then
		player.character_crafting_speed_modifier = player.character_crafting_speed_modifier + 0.1
    end
end)

script.on_event(events.on_player_removed_equipment, function(event)
 	local player = game.players[event.player_index]

  	if event.equipment == "lubricant-fish-equipment" then
  		if event.count >= 0 then
	  		local crafting = player.character_crafting_speed_modifier - (0.1 * event.count)
			
	  		if crafting >= 0 then
				player.character_crafting_speed_modifier = crafting
			end
		end
    end
end)

script.on_event(defines.events.on_player_armor_inventory_changed, function(event)
 
  	local player = game.players[event.player_index]
	local armor = player.get_inventory(defines.inventory.character_armor)
	
	if not armor.is_empty() then
		
		local total_crafting = 0
		local total_health = 0
				
		local grid = armor[1].grid

		if grid ~= nil then

			for i = 1, #grid.equipment do
                if grid.equipment[i].name == "lubricant-fish-equipment" then
                    total_crafting = total_crafting + 0.1
                end
			end

			set_inventory1(player, total_crafting)		
		else
			clear_all_bonuses(player)			
		end	
	else
		clear_all_bonuses(player)
	end
end)

function clear_all_bonuses(player)
	player.character_crafting_speed_modifier = 0
end

function set_inventory1(player, count)
	player.character_crafting_speed_modifier = count
end


local function handle_placement_built(event)
    local entity = event.created_entity
    if not entity or not entity.valid then return end
    if (entity.name == "living-wall") or (entity.name == "biomultiturret") or (entity.name == "brr") then
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