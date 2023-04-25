local sounds = require("__base__/prototypes/entity/sounds")
local hit_effects = require ("__base__/prototypes/entity/hit-effects")
local movement_triggers = require("__base__/prototypes/entity/movement-triggers")
require("animations")

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
      table.insert(recipes, itemRecipe)
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
        stack_size = 1,
        burnt_result = "car-scrap",
        fuel_category = "kms-car-fuel",
        fuel_value = "1J",
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
    {name="car-compilatron", image="compilatron"},
    {name="car-player", image="exoskeleton-equipment"},
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
    "car-compilatron",
    "car-player",
}))

local scrapper = table.deepcopy(data.raw["burner-generator"]["burner-generator"])
scrapper.name = "scrapper"
scrapper.flags = {"placeable-neutral","placeable-player", "player-creation"}
scrapper.icon = "__space-exploration-graphics__/graphics/icons/mechanical-laboratory.png"
scrapper.corpse = "big-remnants"
scrapper.collision_box = {{-3.3, -3.3}, {3.3, 3.3}}
scrapper.selection_box = {{-3.5, -3.5}, {3.5, 3.5}}
scrapper.drawing_box = {{-3.5, -3.9}, {3.5, 3.5}}
scrapper.max_power_output = "1W"
scrapper.minable = {mining_time = 0.2, result = "scrapper"}
scrapper.animation = data.raw["assembling-machine"]["se-space-mechanical-laboratory"].animation
scrapper.burner = {
  fuel_category = "kms-car-fuel",
    effectivity = 1,
    fuel_inventory_size = 1,
    burnt_inventory_size = 1,
    emissions_per_minute = 0,
}

data:extend(
{
    scrapper,
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
        stack_size = 1,
        burnt_result = "car-scrap",
        fuel_category = "kms-car-fuel",
        fuel_value = "1J",
    },
    {
      type = "item",
      name = "car-shop",
      icon = "__space-exploration-graphics__/graphics/icons/pulveriser.png",
      icon_size = 64,
      order = "z[car-shop]",
      stack_size = 1,
      subgroup = "production-machine",
      place_result = "car-shop",
    },
    {
      type = "item",
      name = "scrapper",
      icon = "__space-exploration-graphics__/graphics/icons/mechanical-laboratory.png",
      icon_size = 64,
      order = "z[scrapper]",
      stack_size = 1,
      subgroup = "production-machine",
      place_result = "scrapper",
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
        result = "car-scrap",
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
        result = "car-shop",
        category="crafting-with-fluid",
        subgroup = "production-machine"
    },
    {
      type = "recipe",
      name = "scrapper",
      enabled = false,
      energy_required = 20,
      ingredients =
      {
        {"copper-plate", 1000},
        {"advanced-circuit", 100},
        {
          type="fluid", 
          name="se-pyroflux", 
          amount=1000
        }
      },
      result = "scrapper",
      category="crafting-with-fluid",
      subgroup = "production-machine"
  },
})

local pulverise_target_animation_speed = 0.75
local pulverise_crafting_speed = 2
local pulverise_module_slots = 0
local pulverise_animation_speed = (pulverise_target_animation_speed / pulverise_crafting_speed)

data:extend(
{
  {
    type = "assembling-machine",
    name = "car-shop",
    icon = "__space-exploration-graphics__/graphics/icons/pulveriser.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "car-shop"},
    max_health = 1200,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    drawing_box = {{-3.5, -3.9}, {3.5, 3.5}},
    resistances =
    {
      {
        type = "impact",
        percent = 30
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
      apparent_volume = 1.5,
      idle_sound = {
        filename = "__base__/sound/idle1.ogg",
        volume = 0.6
      },
      sound = {
        {
          filename = "__base__/sound/burner-mining-drill.ogg",
          volume = 0.8
        }
      }
    },
    collision_mask = {
      "water-tile",
      "item-layer",
      "object-layer",
      "player-layer",
    },
    animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/pulveriser/sr/pulveriser.png",
          priority = "high",
          width = 3840/8/2,
          height = 3584/8/2,
          frame_count = 64,
          line_length = 8,
          shift = util.by_pixel(-8, 0),
          animation_speed = pulverise_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/pulveriser/hr/pulveriser.png",
            priority = "high",
            width = 3840/8,
            height = 3584/8,
            frame_count = 64,
            line_length = 8,
            shift = util.by_pixel(-8, 0),
            animation_speed = pulverise_animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-5__/graphics/entity/pulveriser/sr/pulveriser-shadow.png",
          priority = "high",
          width = 694/2,
          height = 400/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(59, 17),
          animation_speed = pulverise_animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-5__/graphics/entity/pulveriser/hr/pulveriser-shadow.png",
            priority = "high",
            width = 694,
            height = 400,
            frame_count = 1,
            line_length = 1,
            repeat_count = 64,
            shift = util.by_pixel(59, 17),
            animation_speed = pulverise_animation_speed,
            scale = 0.5,
          }
        },
      },
    },
    crafting_categories = {"car-crafting"},
    crafting_speed = pulverise_crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "1MW",
    ingredient_count = 12,
    module_specification =
    {
      module_slots = pulverise_module_slots
    },
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.8, size = 18, shift = {0.0, 0.0}, color = {r = 1, g = 0.8, b = 0.5}}
      },
    },
    },
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
        animation = car_spitter_amimations(),
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
        animation = car_biter_animation(),
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
        sound_no_fuel = {
            {
              filename = "__base__/sound/construction-robot-11.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-12.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-13.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-14.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-15.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-16.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-17.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-18.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-19.ogg", volume = volume
            },
            {
              filename = "__base__/sound/flying-robot-1.ogg", volume = 0.43
            },
            {
              filename = "__base__/sound/flying-robot-2.ogg", volume = 0.43
            },
            {
              filename = "__base__/sound/flying-robot-3.ogg", volume = 0.43
            },
            {
              filename = "__base__/sound/flying-robot-4.ogg", volume = 0.43
            },
            {
              filename = "__base__/sound/flying-robot-5.ogg", volume = 0.43
            }
        },
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
              scale = 5 * 1
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
        sound_no_fuel = {
            {
              filename = "__base__/sound/construction-robot-11.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-12.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-13.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-14.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-15.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-16.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-17.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-18.ogg", volume = volume
            },
            {
              filename = "__base__/sound/construction-robot-19.ogg", volume = volume
            },
            {
              filename = "__base__/sound/flying-robot-1.ogg", volume = 0.43
            },
            {
              filename = "__base__/sound/flying-robot-2.ogg", volume = 0.43
            },
            {
              filename = "__base__/sound/flying-robot-3.ogg", volume = 0.43
            },
            {
              filename = "__base__/sound/flying-robot-4.ogg", volume = 0.43
            },
            {
              filename = "__base__/sound/flying-robot-5.ogg", volume = 0.43
            }
        },
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
              scale = 5 * 1
            },
            rotate = false,
            orientation_to_variation = false
        },
    },
    {
      type = "car",
      name = "car-compilatron",
      collision_mask = {},
      equipment_grid = "brr-equipment-grid",
      icon = "__base__/graphics/icons/compilatron.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"}, 
      minable = {mining_time = 0.4, result = "car-compilatron"},
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
      collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
      selection_box = {{-0.8, -1.3}, {0.8, 0.5}},
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
        width = 40,
        height = 52,
        frame_count = 2,
        axially_symmetrical = false,
        direction_count = 32,
        shift = util.by_pixel(0.0, -14.0),
        stripes =
        {
          {
            filename = "__base__/graphics/entity/compilatron/compilatron-walk-1.png",
            width_in_frames = 2,
            height_in_frames = 16
          },
          {
            filename = "__base__/graphics/entity/compilatron/compilatron-walk-2.png",
            width_in_frames = 2,
            height_in_frames = 16
          }
        },
    
        hr_version =
        {
          width = 78,
          height = 104,
          frame_count = 2,
          axially_symmetrical = false,
          direction_count = 32,
          shift = util.by_pixel(0.0, -14),
          scale = 0.5,
          stripes =
          {
            {
              filename = "__base__/graphics/entity/compilatron/hr-compilatron-walk-1.png",
              width_in_frames = 2,
              height_in_frames = 16
            },
            {
              filename = "__base__/graphics/entity/compilatron/hr-compilatron-walk-2.png",
              width_in_frames = 2,
              height_in_frames = 16
            }
          }
        }
      },
      vehicle_impact_sound = sounds.generic_impact,
      rotation_speed = 0.015,
      weight = 700,
      inventory_size = 200,
      track_particle_triggers = movement_triggers.car,
      water_reflection = {
        pictures =
        {
          filename = "__base__/graphics/entity/compilatron/compilatron-reflection.png",
          priority = "extra-high",
          width = 20,
          height = 20,
          shift = util.by_pixel(0, 67 * 0.5),
          scale = 5,
          variation_count = 1
        },
        rotate = false,
        orientation_to_variation = false
      },
  },
  {
    type = "car",
    name = "car-player",
    collision_mask = {},
    equipment_grid = "brr-equipment-grid",
    icon = "__base__/graphics/icons/behemoth-biter.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable", "breaths-air", "not-repairable"}, 
    minable = {mining_time = 0.4, result = "car-player"},
    mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg",volume = 0.8},
    max_health = 1000,
    healing_per_tick = 0.2,
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
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.4, -1.4}, {0.4, 0.2}},
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
    animation = {
      layers =
      {
        character_animations.level1.running,
        character_animations.level1.running_mask,
        character_animations.level3addon.running,
        character_animations.level3addon.running_mask,
        character_animations.level1.running_shadow,
        character_animations.level3addon.running_shadow
      }
    },
    sound_minimum_speed = 0.25,
    sound_scaling_ratio = 0.8,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      {
        filename = "__base__/sound/heartbeat.ogg",
        volume = 0.48
      }
    },
    rotation_speed = 0.015,
    weight = 700,
    inventory_size = 200,
    track_particle_triggers = movement_triggers.car,
    water_reflection = {
      pictures =
      {
        filename = "__base__/graphics/entity/character/character-reflection.png",
        priority = "extra-high",
        -- flags = { "linear-magnification", "not-compressed" },
        -- default value: flags = { "terrain-effect-map" },
        width = 13,
        height = 19,
        shift = util.by_pixel(0, 67 * 0.5),
        scale = 5,
        variation_count = 1
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
            },
            {
              type = "unlock-recipe",
              recipe= "scrapper"
          }
        },
        order = "a-a"
    },
})