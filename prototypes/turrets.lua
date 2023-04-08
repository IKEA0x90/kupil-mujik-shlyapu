local sounds = require("__base__/prototypes/entity/sounds")

function generate_mutlilevel_damage(levels)
    local table_of_tables = {}
    for i=4, levels do
        local inner_table = {
            type = "technology",
            name = "multiturret-damage-"..i,
            icon = "__base__/graphics/technology/laser-damage.png",
            icon_size = 256, icon_mipmaps = 4,
            effects = {
                {
                    type = "ammo-damage",
                    ammo_category = "multiturret",
                    modifier = (1.1 * 1.1) - 1, -- projectile damage 1 increases turret by 0.1 and ammo by 0.1
                }
            },
            prerequisites = { "multiturret-damage-"..(i-1) },
            unit = {
                count = 50 * i,
                ingredients = {
                    { "automation-science-pack", 1 },
                    { "logistic-science-pack", 1 },
                    { "military-science-pack", 1 },
                    { "chemical-science-pack", 1 }
                },
                time = 30
            },
            upgrade = false,
        }
        table.insert(table_of_tables, inner_table)
    end
    return table_of_tables
end

function generate_mutlilevel_speed(levels)
    local table_of_tables = {}
    for i=4, levels do
        local inner_table = {
            type = "technology",
            name = "multiturret-shooting-speed-"..i,
            icon = "__base__/graphics/technology/laser-shooting-speed.png",
            icon_size = 256, icon_mipmaps = 4,
            effects =
            {
                {
                    type = "gun-speed",
                    ammo_category = "multiturret",
                    modifier = 0.1
                },
            },
            prerequisites = { "multiturret-shooting-speed-"..(i-1) },
            unit = {
                count = 300 + (50 * i),
                ingredients = {
                    { "automation-science-pack", 1 },
                    { "logistic-science-pack", 1 },
                    { "military-science-pack", 1 },
                    { "chemical-science-pack", 1 }
                },
                time = 30
            },
            upgrade = false,
        }
        table.insert(table_of_tables, inner_table)
    end
    return table_of_tables
end

local damage_multiple = generate_mutlilevel_damage(30)
local speed_multiple = generate_mutlilevel_speed(30)

data:extend(damage_multiple)
data:extend(speed_multiple)

local ammo_category = {
	type = "ammo-category",
	name = "multiturret"
}

local beam = table.deepcopy(data.raw.beam["electric-beam"])
	beam.name = "multiturret-beam"
	beam.action.action_delivery.target_effects = {
    {
      type = "damage",
      damage = { amount = 3, type = "laser"}
    },
    {
      type = "damage",
      damage = { amount = 3, type = "electric"}
    },
    {
      type = "damage",
      damage = { amount = 3, type = "physical"}
    },
    {
      type = "damage",
      damage = { amount = 3, type = "poison"}
    },
    {
      type = "damage",
      damage = { amount = 3, type = "explosion"}
    },
    {
      type = "damage",
      damage = { amount = 3, type = "fire"}
    },
    {
      type = "damage",
      damage = { amount = 3, type = "acid"}
    },
    {
      type = "damage",
      damage = { amount = 3, type = "cold"}
    },
    {
      type = "damage",
      damage = { amount = 3, type = "impact"}
    },
    {
      type = "damage",
      damage = { amount = 3, type = "meteor"}
    },
    {
      type = "damage",
      damage = { amount = 3, type = "suffocation"}
    },
    {
      type = "damage",
      damage = { amount = 3, type = "plasma"}
    },
    {
      type = "damage",
      damage = { amount = 3, type = "bob-pierce"}
    },
	}
	beam.damage_interval = 2 -- gun turret = 6, laser-turret = 40

local multiturret = table.deepcopy(data.raw["electric-turret"]["tesla-turret"])
multiturret.name = "multiturret"
multiturret.minable = { mining_time = 0.1, result = "multiturret" }
multiturret.attack_parameters.ammo_type.category = "multiturret"
multiturret.attack_parameters.ammo_type.action.action_delivery.beam = "multiturret-beam"
multiturret.energy_source.input_flow_limit = "100MW"
multiturret.energy_source.drain = "24kW"
multiturret.attack_parameters.ammo_type.energy_consumption = "50kW"

local multiturretmk2 = table.deepcopy(data.raw["electric-turret"]["tesla-turret"])

multiturretmk2.attack_parameters.ammo_type.category = "multiturret"
multiturretmk2.attack_parameters.ammo_type.action.action_delivery.beam = "multiturret-beam"
multiturretmk2.energy_source.input_flow_limit = "100MW"
multiturretmk2.energy_source.drain = "24kW"
multiturretmk2.attack_parameters.ammo_type.energy_consumption = "50kW"
multiturretmk2.attack_parameters.ammo_type.action.action_delivery.max_length = 30
multiturretmk2.attack_parameters.ammo_type.action.action_delivery.duration = 2

multiturretmk2.name = "multiturretmk2"
multiturretmk2.minable = { mining_time = 0.1, result = "multiturretmk2" }
multiturretmk2.prepare_range = 35
multiturretmk2.attack_parameters.cooldown = 2
multiturretmk2.attack_parameters.range = 30
multiturretmk2.max_health = 800

local long_boi_attack_splash = table.deepcopy(data.raw["fire"]["acid-splash-fire-worm-behemoth"])
long_boi_attack_splash.name = "long-boi-attack-splash"
long_boi_attack_splash.on_damage_tick_effect.action_delivery.target_effects[1].damage = {1.2, type = "laser"}
long_boi_attack_splash.damage_per_tick = {amount = 0 / 60, type = "laser"}

local long_boi_attack = table.deepcopy(data.raw["stream"]["acid-stream-worm-behemoth"])
long_boi_attack.name = "long-boi-attack"
long_boi_attack.initial_action[2].action_delivery.target_effects[2].damage = {amount = 1, type = "laser"}
long_boi_attack.initial_action[1].action_delivery.target_effects[2].entity_name = "long-boi-attack-splash"
long_boi_attack.special_neutral_target_damage = {amount = 1, type = "laser"}

local bioturret = table.deepcopy(data.raw["turret"]["behemoth-worm-turret"])
bioturret.flags = {"placeable-player", "placeable-off-grid", "not-repairable", "breaths-air", "player-creation"}
bioturret.name = "bioturret"
bioturret.minable = { mining_time = 0.1, result = "bioturret" }
bioturret.prepare_range = 220
bioturret.attack_parameters.range = 200
bioturret.build_base_evolution_requirement = nil
bioturret.autoplace = nil
bioturret.preparing_sound = sounds.worm_standup(0.2)
bioturret.prepared_sound = sounds.worm_breath_big(0.2)
bioturret.prepared_alternative_sound = sounds.worm_roar_alternative_big(0.2)
bioturret.starting_attack_sound = sounds.worm_roars_big(0.2)
bioturret.attack_parameters.min_range = 20
bioturret.attack_parameters.turn_range = 0.4
bioturret.allow_turning_when_starting_attack = false
bioturret.turret_base_has_direction = true
bioturret.attack_parameters.ammo_type.action.action_delivery.stream = "long-boi-attack"

data:extend({

    ammo_category,
    beam,
    multiturret,
    multiturretmk2,
    long_boi_attack_splash,
    long_boi_attack,
    bioturret,

    {
        type = "item",
        name = "damage-prism",
        icons = {
          {
            icon = "__kupil-mujik-shlyapu__/graphics/icons/prism.png",
          },
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "intermediate-product",
        order = "z[prism]",
        stack_size = 100,
    },
    {
        type = "item",
        name = "multiturret",
        icons = {
          {
            icon = "__base__/graphics/icons/fish.png",
          },
          {
            icon = "__base__/graphics/icons/atomic-bomb.png",
          }
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "defensive-structure",
        order = "z[multiturret]",
        stack_size = 50,
        place_result = "multiturret"
    },
    {
        type = "item",
        name = "multiturretmk2",
        icons = {
          {
            icon = "__base__/graphics/icons/fish.png",
          },
          {
            icon = "__base__/graphics/icons/uranium-fuel-cell.png",
          }
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "defensive-structure",
        order = "z[multiturretmk2]",
        stack_size = 50,
        place_result = "multiturretmk2"
      },
      {
        type = "item",
        name = "bioturret",
        icons = {
          {
            icon = "__base__/graphics/icons/behemoth-worm.png",
          },
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "defensive-structure",
        order = "z[bioturret]",
        stack_size = 50,
        place_result = "bioturret"
      },
})

data:extend({
    {
        type = "technology",
        name = "multiturret",
        icon = "__base__/graphics/technology/laser-turret.png",
        icon_size = 256, icon_mipmaps = 4,
        effects = {
        {
            type = "unlock-recipe",
            recipe = "multiturret"
        },
        {
            type = "unlock-recipe",
            recipe= "damage-prism"
        },
        },
        prerequisites = { "military", "electronics", },
        unit = {
        ingredients = {
            { "automation-science-pack", 1 },
        },
        time = 15,
        count = 100
        }
    },
    {
        type = "technology",
        name = "multiturretmk2",
        icon = "__base__/graphics/technology/laser-turret.png",
        icon_size = 256, icon_mipmaps = 4,
        effects = {
        {
            type = "unlock-recipe",
            recipe = "multiturretmk2"
        }
        },
        prerequisites = { "military", "electronics", },
        unit = {
        ingredients = {
            { "automation-science-pack", 2 },
            { "logistic-science-pack", 2 },
            { "military-science-pack", 2 },
            { "chemical-science-pack", 1 },
        },
        time = 15,
        count = 250
        } 
    },
    {
        type = "technology",
        name = "multiturret-damage-1",
        icon = "__base__/graphics/technology/laser-damage.png",
        icon_size = 256, icon_mipmaps = 4,
        effects = {
          {
            type = "ammo-damage",
            ammo_category = "multiturret",
            modifier = (1.1 * 1.1) - 1, -- projectile damage 1 increases turret by 0.1 and ammo by 0.1
          }
        },
        prerequisites = { "multiturret" },
        unit =
        {
          count = 100 * 1,
          ingredients =
          {
            { "automation-science-pack", 1 }
          },
          time = 30
        },
        upgrade = true,
    },
    {
        type = "technology",
        name = "multiturret-damage-2",
        icon = "__base__/graphics/technology/laser-damage.png",
        icon_size = 256, icon_mipmaps = 4,
        effects = {
          {
            type = "ammo-damage",
            ammo_category = "multiturret",
            modifier = (1.1 * 1.1) - 1,
          }
        },
        prerequisites = { "multiturret-damage-1" },
        unit =
        {
          count = 100 * 2,
          ingredients =
          {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
          },
          time = 30
        },
        upgrade = true,
    },
    
    {
        type = "technology",
        name = "multiturret-damage-3",
        icon = "__base__/graphics/technology/laser-damage.png",
        icon_size = 256, icon_mipmaps = 4,
        effects = {
          {
            type = "ammo-damage",
            ammo_category = "multiturret",
            modifier = (1.1 * 1.1) - 1,
          }
        },
        prerequisites = { "multiturret-damage-2" },
        unit =
        {
          count = 100 * 3,
          ingredients =
          {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
            { "military-science-pack", 1 }
          },
          time = 30
        },
        upgrade = true,
    },
    {
        type = "technology",
        name = "multiturret-shooting-speed-1",
        icon = "__base__/graphics/technology/laser-shooting-speed.png",
        icon_size = 256, icon_mipmaps = 4,
        effects =
        {
          {
            type = "gun-speed",
            ammo_category = "multiturret",
            modifier = 0.1
          },
        },
        prerequisites = { "multiturret" },
        unit =
        {
          count = 100 * 1,
          ingredients =
          {
            { "automation-science-pack", 1 }
          },
          time = 30
        },
        upgrade = true,
    },
    {
        type = "technology",
        name = "multiturret-shooting-speed-2",
        icon = "__base__/graphics/technology/laser-shooting-speed.png",
        icon_size = 256, icon_mipmaps = 4,
        effects =
        {
          {
            type = "gun-speed",
            ammo_category = "multiturret",
            modifier = 0.1
          },
        },
        prerequisites = { "multiturret-shooting-speed-1" },
        unit =
        {
          count = 100 * 2,
          ingredients =
          {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
          },
          time = 30
        },
        upgrade = true,
    },
    
    {
        type = "technology",
        name = "multiturret-shooting-speed-3",
        icon = "__base__/graphics/technology/laser-shooting-speed.png",
        icon_size = 256, icon_mipmaps = 4,
        effects =
        {
          {
            type = "gun-speed",
            ammo_category = "multiturret",
            modifier = 0.1
          },
        },
        prerequisites = { "multiturret-shooting-speed-2" },
        unit =
        {
          count = 100 * 3,
          ingredients =
          {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
            { "military-science-pack", 1 }
          },
          time = 30
        },
        upgrade = true,
    },
})

data:extend({
    {
        type = "recipe",
        name = "damage-prism",
        enabled = false,
        energy_required = 0.5,
        ingredients = {
          { "small-lamp", 1 },
          { "red-wire", 3 },
          { "green-wire", 3 },
        },
        result = "damage-prism"
    },
    {
        type = "recipe",
        name = "multiturret",
        factions = { "electric" },
        enabled = false,
        energy_required = 4,
        ingredients = {
          { "damage-prism", 1 },
          { "arithmetic-combinator", 1 },
        },
        result = "multiturret"
    },
    {
        type = "recipe",
        name = "multiturretmk2",
        factions = { "electric" },
        category = "crafting-with-fluid",
        enabled = false,
        energy_required = 6,
        ingredients = {
          { "battery", 3 },
          {type="fluid", name="gamer-juice", amount=40},
          { "multiturret", 2 },
        },
        result = "multiturretmk2"
    },
    {
      type = "recipe",
      name = "bioturret",
      category = "crafting-with-fluid",
      enabled = false,
      energy_required = 10,
      ingredients =
        {
          {"solar-panel-equipment", 2},
          {"sulfur", 5},
          {"landfill", 2},
          {type = "fluid", name = "samurai-tears", amount = 30}
        },
      result = "bioturret"
    },
})