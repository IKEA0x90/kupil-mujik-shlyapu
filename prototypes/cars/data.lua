local sounds = require("__base__/prototypes/entity/sounds")
local hit_effects = require ("__base__/prototypes/entity/hit-effects")
local movement_triggers = require("__base__/prototypes/entity/movement-triggers")

function createRecipeTable(names)
    local recipes = {}
    for _, name in pairs(names) do
      local itemRecipe = {
        type = "recipe",
        name = name,
        energy_required = 20,
        ingredients = {
          {"car-scrap", 1},
        },
        result = name,
        category="car-crafting",
        subgroup = "bullet",
        hide_from_player_crafting = true,
      }
      local scrapRecipe = {
        type = "recipe",
        name = "car-scrap-" .. name,
        energy_required = 20,
        ingredients = {
          {name, 1},
        },
        result = "car-scrap",
        category="car-crafting",
        subgroup = "bullet",
        hide_from_player_crafting = true,
      }
      table.insert(recipes, itemRecipe)
      table.insert(recipes, scrapRecipe)
    end
    return recipes
end

function createItemTable(items)
    local result = {}
    for _, item in pairs(items) do
      local itemTable = {
        type = "item-with-entity-data",
        name = item.name,
        icon = "__base__/graphics/icons/" .. item.image .. ".png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "bullet",
        order = "b[personal-transport]-z[" .. item.name .. "]",
        place_result = item.name,
        stack_size = 1
      }
      table.insert(result, itemTable)
    end
    return result
end

data:extend(createItemTable({
    {name="brr", image="behemoth-spitter"},
    --{name="car-biter-small", image="small-biter"},
    --{name="car-biter-medium", image="medium-biter"},
    --{name="car-biter-big", image="big-biter"},
    {name="car-biter-behemoth", image="behemoth-biter"},
    --{name="car-spitter-small", image="small-spitter"},
    --{name="car-spitter-medium", image="medium-spitter"},
    --{name="car-spitter-big", image="big-spitter"},
    {name="car-logistic-drone", image="logistic-robot"},
    {name="car-construction-drone", image="construction-robot"},
}))

data:extend(createRecipeTable({
    "invisicar",
    "brr",
    --"car-biter-small",
    --"car-biter-medium",
    --"car-biter-big",
    "car-biter-behemoth",
    --"car-spitter-small",
    --"car-spitter-medium",
    --"car-spitter-big",
    "car-logistic-drone",
    "car-construction-drone",
}))

data:extend(
{
    {
        type = "recipe-category",
        name = "car-crafting",
        localised_name = "Car modification",
        localised_description = "Nizkaya podveska"
    },
    {
        type = "item",
        name = "car-scrap",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/car-scrap.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "raw-material",
        order = "b[zzz]-z[zzz]",
        stack_size = 1
    },
    {
        type = "item-with-entity-data",
        name = "invisicar",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/empty.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "bullet",
        order = "b[personal-transport]-z[invisicar]",
        place_result = "invisicar",
        stack_size = 1
    },
    {
        type = "item",
        name = "car-shop",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/car-shop.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "production-machine",
        order = "z[car-shop]",
        place_result = "car-shop",
        stack_size = 1
    },
})

data:extend(
{
    {
        type = "recipe",
        name = "car-scrap",
        enabled = false,
        energy_required = 20,
        ingredients =
        {
          {"sulfur", 100},
          {"raw-fish", 100},
          {"low-density-structure", 100},
          {"processing-unit", 100},
          {
            type="fluid", 
            name="samurai-tears", 
            amount=1000
          }
        },
        result = "brr",
        category="crafting-with-fluid",
        subgroup = "bullet"
    },
    {
        type = "recipe",
        name = "car-shop",
        enabled = false,
        energy_required = 20,
        ingredients =
        {
          {"steel-plate", 500},
          {"advanced-circuit", 100},
          {
            type="fluid", 
            name="steam", 
            amount=10000
          }
        },
        result = "brr",
        category="crafting-with-fluid",
        subgroup = "bullet"
    },
})

data:extend(
{
    {
        type = "car",
        name = "brr",
        collision_mask = {},
        equipment_grid = "brr-equipment-grid",
        icon = "__base__/graphics/icons/behemoth-spitter.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable", "breaths-air", "not-repairable"}, 
        minable = {mining_time = 0.4, result = "brr"},
        mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg",volume = 0.8},
        max_health = 1000,
        healing_per_tick = 0.2,
        corpse = "behemoth-spitter-corpse",
        alert_icon_shift = util.by_pixel(0, -13),
        energy_per_hit_point = 1,
        crash_trigger = crash_trigger(),
        resistances =
        {
          {
            type = "impact",
            percent = 30,
            decrease = 50
          },
          {
            type = "acid",
            percent = 100
          }
        },
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
        damaged_trigger_effect = hit_effects.entity(),
        effectivity = 8,
        braking_power = "1000kW",
        burner =
        {
          fuel_category = "fish-fuel",
          effectivity = 200,
          burnt_inventory_size = 3,
          fuel_inventory_size = 3,
          smoke =
          {
            {
            name = "magenta-smoke-big",
            north_position = {0.0, -1.0},
            east_position = {0.75, -0.75},
            frequency = 10 / 32,
            starting_vertical_speed = 0.08,
            slow_down_factor = 1,
            starting_frame_deviation = 60
            }
          }
        },
        consumption = "50kW",
        friction = 2e-3,
        animation = spitterrunanimation(scale_spitter_behemoth, tint_1_spitter_behemoth, tint_2_spitter_behemoth),
        sound_no_fuel = sounds.spitter_dying_behemoth(0.70),
        stop_trigger_speed = 0.15,
        stop_trigger =
        {
          {
            type = "play-sound",
            sound =
            {
              {
                filename = "__base__/sound/creatures/spitter-call-big-1.ogg",
                volume = volume
              },
              {
                filename = "__base__/sound/creatures/spitter-call-big-2.ogg",
                volume = volume
              },
              {
                filename = "__base__/sound/creatures/spitter-call-big-3.ogg",
                volume = volume
              },
              {
                filename = "__base__/sound/creatures/spitter-call-big-4.ogg",
                volume = volume
              },
              {
                filename = "__base__/sound/creatures/spitter-call-big-5.ogg",
                volume = volume
              }
            }
          }
        },
        sound_minimum_speed = 0.25,
        sound_scaling_ratio = 0.8,
        vehicle_impact_sound = sounds.generic_impact,
        working_sound = sounds.spitter_walk_big(0.6),
        rotation_speed = 0.015,
        weight = 700,
        inventory_size = 200,
        track_particle_triggers = movement_triggers.car,
        water_reflection = spitter_water_reflection(scale_spitter_behemoth),
    },
    {
        type = "car",
        name = "car-biter-behemoth",
        collision_mask = {},
        equipment_grid = "brr-equipment-grid",
        icon = "__base__/graphics/icons/behemoth-biter.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable", "breaths-air", "not-repairable"}, 
        minable = {mining_time = 0.4, result = "car-biter-behemoth"},
        mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg",volume = 0.8},
        max_health = 1000,
        healing_per_tick = 0.2,
        corpse = "behemoth-biter-corpse",
        alert_icon_shift = util.by_pixel(0, -13),
        energy_per_hit_point = 1,
        crash_trigger = crash_trigger(),
        resistances =
        {
          {
            type = "impact",
            percent = 30,
            decrease = 50
          },
          {
            type = "acid",
            percent = 100
          }
        },
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.7, -1.0}, {0.7, 1.0}},
        damaged_trigger_effect = hit_effects.entity(),
        effectivity = 8,
        braking_power = "1000kW",
        burner =
        {
          fuel_category = "fish-fuel",
          effectivity = 200,
          burnt_inventory_size = 3,
          fuel_inventory_size = 3,
          smoke =
          {
            {
            name = "magenta-smoke-big",
            north_position = {0.0, -1.0},
            east_position = {0.75, -0.75},
            frequency = 10 / 32,
            starting_vertical_speed = 0.08,
            slow_down_factor = 1,
            starting_frame_deviation = 60
            }
          }
        },
        consumption = "50kW",
        friction = 2e-3,
        animation = biterrunanimation(behemoth_biter_scale, behemoth_biter_tint1, behemoth_biter_tint2),
        sound_no_fuel = sounds.biter_dying_big(0.72),
        stop_trigger_speed = 0.15,
        stop_trigger =
        {
          {
            type = "play-sound",
            sound =
            {
                {
                  filename = "__base__/sound/creatures/biter-roar-behemoth-1.ogg",
                  volume = volume
                },
                {
                  filename = "__base__/sound/creatures/biter-roar-behemoth-2.ogg",
                  volume = volume
                },
                {
                  filename = "__base__/sound/creatures/biter-roar-behemoth-3.ogg",
                  volume = volume
                },
                {
                  filename = "__base__/sound/creatures/biter-roar-behemoth-4.ogg",
                  volume = volume
                },
                {
                  filename = "__base__/sound/creatures/biter-roar-behemoth-4.ogg",
                  volume = volume
                },
                {
                  filename = "__base__/sound/creatures/biter-roar-behemoth-5.ogg",
                  volume = volume
                },
                {
                  filename = "__base__/sound/creatures/biter-roar-behemoth-6.ogg",
                  volume = volume
                },
                {
                  filename = "__base__/sound/creatures/biter-roar-behemoth-7.ogg",
                  volume = volume
                },
                {
                  filename = "__base__/sound/creatures/biter-roar-behemoth-8.ogg",
                  volume = volume
                },
                {
                  filename = "__base__/sound/creatures/biter-roar-behemoth-9.ogg",
                  volume = volume
                }
            }
          }
        },
        sound_minimum_speed = 0.25,
        sound_scaling_ratio = 0.8,
        vehicle_impact_sound = sounds.generic_impact,
        working_sound = sounds.biter_walk_big(0.78),
        rotation_speed = 0.015,
        weight = 700,
        inventory_size = 200,
        track_particle_triggers = movement_triggers.car,
        water_reflection = biter_water_reflection(behemoth_biter_scale),
    },
    {
      type = "car",
      name = "invisicar",
      icon = "__kupil-mujik-shlyapu__/graphics/icons/empty.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"}, 
      minable = {mining_time = 0.4, result = "invisicar"},
      max_health = 1000,
      alert_icon_shift = util.by_pixel(0, -10e100),
      energy_per_hit_point = 1,
      resistances =
      {
        {
          type = "impact",
          percent = 100,
          decrease = 50
        },
        {
          type = "acid",
          percent = 100
        }
      },
      collision_box = {{-0.7, -1}, {0.7, 1}},
      selection_box = {{-0.7, -1}, {0.7, 1}},
      effectivity = 1,
      braking_power = "200kW",
      burner =
      {
        fuel_category = "chemical",
        effectivity = 1,
        fuel_inventory_size = 3,
      },
      consumption = "150kW",
      friction = 2e-3,
      stop_trigger_speed = 0.15,
      rotation_speed = 0.015,
      weight = 700,
      inventory_size = 100,
      animation =
      {
        layers =
        {
          {
            priority = "low",
            width = 102,
            height = 86,
            frame_count = 2,
            direction_count = 64,
            shift = {0, -0.1875},
            animation_speed = 8,
            max_advance = 0.2,
            stripes =
            {
              {
                filename = "__kupil-mujik-shlyapu__/graphics/entity/car/car-1.png",
                width_in_frames = 2,
                height_in_frames = 22
              },
              {
                filename = "__kupil-mujik-shlyapu__/graphics/entity/car/car-2.png",
                width_in_frames = 2,
                height_in_frames = 22
              },
              {
                filename = "__kupil-mujik-shlyapu__/graphics/entity/car/car-3.png",
                width_in_frames = 2,
                height_in_frames = 20
              }
            },
          },
          {
            priority = "low",
            width = 100,
            height = 75,
            frame_count = 2,
            apply_runtime_tint = true,
            direction_count = 64,
            max_advance = 0.2,
            line_length = 2,
            shift = {0, -0.171875},
            stripes = util.multiplystripes(2,
            {
              {
                filename = "__kupil-mujik-shlyapu__/graphics/entity/car/car-mask-1.png",
                width_in_frames = 1,
                height_in_frames = 22
              },
              {
                filename = "__kupil-mujik-shlyapu__/graphics/entity/car/car-mask-2.png",
                width_in_frames = 1,
                height_in_frames = 22
              },
              {
                filename = "__kupil-mujik-shlyapu__/graphics/entity/car/car-mask-3.png",
                width_in_frames = 1,
                height_in_frames = 20
              }
            }),
          },
          {
            priority = "low",
            width = 114,
            height = 76,
            frame_count = 2,
            draw_as_shadow = true,
            direction_count = 64,
            shift = {0.28125, 0.25},
            max_advance = 0.2,
            stripes = util.multiplystripes(2,
            {
              {
                filename = "__kupil-mujik-shlyapu__/graphics/entity/car/car-shadow-1.png",
                width_in_frames = 1,
                height_in_frames = 22
              },
              {
                filename = "__kupil-mujik-shlyapu__/graphics/entity/car/car-shadow-2.png",
                width_in_frames = 1,
                height_in_frames = 22
              },
              {
                filename = "__kupil-mujik-shlyapu__/graphics/entity/car/car-shadow-3.png",
                width_in_frames = 1,
                height_in_frames = 20
              }
            })
          }
        }
      },
    },
    {
        type = "car",
        name = "car-logistic-drone",
        collision_mask = {},
        equipment_grid = "brr-equipment-grid",
        icon = "__base__/graphics/icons/logistic-robot.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"}, 
        minable = {mining_time = 0.4, result = "car-logistic-drone"},
        mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg",volume = 0.8},
        max_health = 1000,
        alert_icon_shift = util.by_pixel(0, 0),
        energy_per_hit_point = 1,
        crash_trigger = crash_trigger(),
        resistances =
        {
          {
            type = "impact",
            percent = 30,
            decrease = 50
          },
          {
            type = "acid",
            percent = 100
          }
        },
        collision_box = {{0, 0}, {0, 0}},
        selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
        damaged_trigger_effect = hit_effects.entity(),
        effectivity = 8,
        braking_power = "1000kW",
        burner =
        {
          fuel_category = "sus-battery",
          effectivity = 200,
          burnt_inventory_size = 3,
          fuel_inventory_size = 3,
          smoke =
          {
            {
            name = "magenta-smoke-big",
            north_position = {0.0, -1.0},
            east_position = {0.75, -0.75},
            frequency = 10 / 32,
            starting_vertical_speed = 0.08,
            slow_down_factor = 1,
            starting_frame_deviation = 60
            }
          }
        },
        consumption = "50kW",
        friction = 2e-3,
        animation = {
            filename = "__base__/graphics/entity/logistic-robot/logistic-robot.png",
            priority = "high",
            line_length = 16,
            width = 41,
            height = 42,
            frame_count = 1,
            shift = util.by_pixel(0, -3),
            direction_count = 16,
            y = 126,
            hr_version =
            {
              filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot.png",
              priority = "high",
              line_length = 16,
              width = 80,
              height = 84,
              frame_count = 1,
              shift = util.by_pixel(0, -3),
              direction_count = 16,
              y = 252,
              scale = 0.5
            }
        },
        sound_no_fuel = sounds.flying_robot(0.48),
        stop_trigger_speed = 0.15,
        stop_trigger =
        {
          {
            type = "play-sound",
            sound =
            {
              {
                filename = "__base__/sound/robot-repair-1.ogg",
                volume = volume
              },
            }
          }
        },
        sound_minimum_speed = 0.25,
        sound_scaling_ratio = 0.8,
        vehicle_impact_sound = sounds.generic_impact,
        working_sound = sounds.flying_robot(0.48),
        rotation_speed = 0.015,
        weight = 700,
        inventory_size = 200,
        track_particle_triggers = movement_triggers.car,
        water_reflection = {
            pictures =
            {
              filename = "__base__/graphics/entity/construction-robot/construction-robot-reflection.png",
              priority = "extra-high",
              width = 12,
              height = 12,
              shift = util.by_pixel(0, 105),
              variation_count = 1,
              scale = 5 * scale
            },
            rotate = false,
            orientation_to_variation = false
        },
    },
    {
        type = "car",
        name = "car-construction-drone",
        collision_mask = {},
        equipment_grid = "brr-equipment-grid",
        icon = "__base__/graphics/icons/construction-robot.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"}, 
        minable = {mining_time = 0.4, result = "car-construction-drone"},
        mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg",volume = 0.8},
        max_health = 1000,
        alert_icon_shift = util.by_pixel(0, 0),
        energy_per_hit_point = 1,
        crash_trigger = crash_trigger(),
        resistances =
        {
          {
            type = "impact",
            percent = 30,
            decrease = 50
          },
          {
            type = "acid",
            percent = 100
          }
        },
        collision_box = {{0, 0}, {0, 0}},
        selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
        damaged_trigger_effect = hit_effects.entity(),
        effectivity = 8,
        braking_power = "1000kW",
        burner =
        {
          fuel_category = "sus-battery",
          effectivity = 200,
          burnt_inventory_size = 3,
          fuel_inventory_size = 3,
          smoke =
          {
            {
            name = "magenta-smoke-big",
            north_position = {0.0, -1.0},
            east_position = {0.75, -0.75},
            frequency = 10 / 32,
            starting_vertical_speed = 0.08,
            slow_down_factor = 1,
            starting_frame_deviation = 60
            }
          }
        },
        consumption = "50kW",
        friction = 2e-3,
        animation = {
            filename = "__base__/graphics/entity/construction-robot/construction-robot.png",
            priority = "high",
            line_length = 16,
            width = 32,
            height = 36,
            frame_count = 1,
            shift = util.by_pixel(0, -4.5),
            direction_count = 16,
            y = 36,
            hr_version =
            {
              filename = "__base__/graphics/entity/construction-robot/hr-construction-robot.png",
              priority = "high",
              line_length = 16,
              width = 66,
              height = 76,
              frame_count = 1,
              shift = util.by_pixel(0, -4.5),
              direction_count = 16,
              y = 76,
              scale = 0.5
            }
        },
        sound_no_fuel = sounds.flying_robot(0.48),
        stop_trigger_speed = 0.15,
        stop_trigger =
        {
          {
            type = "play-sound",
            sound =
            {
              {
                filename = "__base__/sound/robot-repair-1.ogg",
                volume = volume
              },
            }
          }
        },
        sound_minimum_speed = 0.25,
        sound_scaling_ratio = 0.8,
        vehicle_impact_sound = sounds.generic_impact,
        working_sound = sounds.flying_robot(0.48),
        rotation_speed = 0.015,
        weight = 700,
        inventory_size = 200,
        track_particle_triggers = movement_triggers.car,
        water_reflection = {
            pictures =
            {
              filename = "__base__/graphics/entity/construction-robot/construction-robot-reflection.png",
              priority = "extra-high",
              width = 12,
              height = 12,
              shift = util.by_pixel(0, 105),
              variation_count = 1,
              scale = 5 * scale
            },
            rotate = false,
            orientation_to_variation = false
        },
    },
})

data:extend(
{
    {
        type = "technology",
        name = "km-cars",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__kupil-mujik-shlyapu__/graphics/technology/car-scrap.png",
        prerequisites = {"automobilism"},
        unit =
        {
        count_formula = "250",
        ingredients =
        {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 },
            { "chemical-science-pack", 1 },
        },
        time = 20
        },
        max_level = "1",
        effects =
        {
            {
                type = "unlock-recipe",
                recipe= "car-scrap"
            },
            {
                type = "unlock-recipe",
                recipe= "car-shop"
            }
        },
        order = "a-a"
    },
})