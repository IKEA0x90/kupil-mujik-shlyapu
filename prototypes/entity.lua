local sounds = require("__base__/prototypes/entity/sounds")
local hit_effects = require ("__base__/prototypes/entity/hit-effects")
local movement_triggers = require("__base__/prototypes/entity/movement-triggers")
require ("__base__/prototypes/entity/biter-animations")

function accumulator_picture(tint, repeat_count)
  return
  {
    layers =
    {
      {
        filename = "__base__/graphics/entity/accumulator/accumulator.png",
        priority = "high",
        width = 66,
        height = 94,
        repeat_count = repeat_count,
        shift = util.by_pixel(0, -10),
        tint = tint,
        animation_speed = 0.5,
        hr_version =
        {
          filename = "__base__/graphics/entity/accumulator/hr-accumulator.png",
          priority = "high",
          width = 130,
          height = 189,
          repeat_count = repeat_count,
          shift = util.by_pixel(0, -11),
          tint = tint,
          animation_speed = 0.5,
          scale = 0.5
        }
      },
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-shadow.png",
        priority = "high",
        width = 120,
        height = 54,
        repeat_count = repeat_count,
        shift = util.by_pixel(28, 6),
        draw_as_shadow = true,
        hr_version =
        {
          filename = "__base__/graphics/entity/accumulator/hr-accumulator-shadow.png",
          priority = "high",
          width = 234,
          height = 106,
          repeat_count = repeat_count,
          shift = util.by_pixel(29, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    }
  }
end

function accumulator_charge()
  return
  {
    layers =
    {
      accumulator_picture({ r=1, g=1, b=1, a=1 } , 24),
      {
        filename = "__base__/graphics/entity/accumulator/accumulator-charge.png",
        priority = "high",
        width = 90,
        height = 100,
        line_length = 6,
        frame_count = 24,
        draw_as_glow = true,
        shift = util.by_pixel(0, -22),
        hr_version =
        {
          filename = "__base__/graphics/entity/accumulator/hr-accumulator-charge.png",
          priority = "high",
          width = 178,
          height = 206,
          line_length = 6,
          frame_count = 24,
          draw_as_glow = true,
          shift = util.by_pixel(0, -22),
          scale = 0.5
        }
      }
    }
  }
end

local discharger = table.deepcopy(data.raw["burner-generator"]["burner-generator"])
discharger.name = "interesting-battery-discharger"
discharger.icon = "__kupil-mujik-shlyapu__/graphics/icons/interesting-battery-discharger.png"
discharger.corpse = "accumulator-remnants"
discharger.collision_box = {{-0.9, -0.9}, {0.9, 0.9}}
discharger.selection_box = {{-1, -1}, {1, 1}}
discharger.drawing_box = {{-1, -1.5}, {1, 1}}
discharger.max_power_output = "2MW"
discharger.minable = {mining_time = 2, result = "interesting-battery-discharger"}
discharger.animation = {
  north = accumulator_charge(),
  east = accumulator_charge(),
  south = accumulator_charge(),
  west = accumulator_charge()

}
discharger.burner = {
  fuel_category = "sus-battery",
    effectivity = 1,
    fuel_inventory_size = 1,
    burnt_inventory_size = 1,
    emissions_per_minute = 0,
    smoke =
    {
      {
        name = "magenta-smoke-big",
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        deviation = {0.1, 0.1},
        frequency = 9
      }
    }
}

local charger = table.deepcopy(data.raw["furnace"]["electric-furnace"])
charger.name = "interesting-battery-charger"
charger.corpse = "accumulator-remnants"
charger.collision_box = {{-0.9, -0.9}, {0.9, 0.9}}
charger.selection_box = {{-1, -1}, {1, 1}}
charger.drawing_box = {{-1, -1.5}, {1, 1}}
charger.minable = {mining_time = 1, result = "interesting-battery-charger"}
charger.animation = accumulator_charge()
charger.allowed_effects = {}
charger.crafting_categories = {"sus-battery"}
charger.crafting_speed = 1
charger.energy_usage = "1MW"
charger.energy_source.emissions_per_minute = 0
charger.energy_source.drain = "1W"
charger.icon = "__kupil-mujik-shlyapu__/graphics/icons/interesting-battery-charger.png"
charger.working_sound = {
    sound =
    {
      filename = "__base__/sound/accumulator-working.ogg",
      volume = 0.4
    },
    idle_sound =
    {
      filename = "__base__/sound/accumulator-idle.ogg",
      volume = 0.35
    },
    --persistent = true,
    max_sounds_per_type = 3,
    audible_distance_modifier = 0.5,
    fade_in_ticks = 4,
    fade_out_ticks = 20
  }
charger.working_visualisations = {}
charger.module_specification.module_slots = 0

local living_wall = table.deepcopy(data.raw["wall"]["stone-wall"])
living_wall.name = "living-wall"
living_wall.minable = {mining_time = 0.1, result = "living-wall"}
living_wall.max_health = 1200
living_wall.flags =  {"placeable-player", "not-repairable", "breaths-air", "player-creation", "placeable-off-grid"}
living_wall.next_upgrade = nil
for _, picture in pairs(living_wall.pictures) do
  if picture.layers then
    for _, layer in pairs(picture.layers) do
      layer.tint = {r=0, g=1, b=0, a=1}
      if layer.hr_version then
        layer.hr_version.tint = {r=0, g=1, b=0, a=1}
      end
    end
  end
end

local radar_mk2 = table.deepcopy(data.raw["radar"]["radar"])
radar_mk2.name = "radar-mk2"
radar_mk2.energy_per_sector = "30MJ"
radar_mk2.max_distance_of_sector_revealed = 30
radar_mk2.max_distance_of_nearby_sector_revealed = 10
radar_mk2.energy_per_nearby_scan = "2MJ" 
radar_mk2.energy_usage = "1MW"
radar_mk2.rotation_speed = 0.2
radar_mk2.minable = {mining_time = 0.5, result = "radar-mk2"}

local robocharger = table.deepcopy(data.raw["roboport"]["roboport"])
robocharger.name = "robocharger"
robocharger.minable = {mining_time = 0.5, result = "robocharger"}
robocharger.energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    input_flow_limit = "100MW",
    buffer_capacity = "500MJ"
  }
robocharger.charging_energy = "10MW"
robocharger.construction_radius = 0
robocharger.logistics_radius = 0
robocharger.material_slots_count = 0
robocharger.robot_slots_count = 0
robocharger.charging_offsets = {
  { -1, 1 },
  { 0, 1 },
  { 1, 1 },
  { -1, 0 },
  { 0, 0 },
  { 1, 0 },
  { -1, -1 },
  { 0, -1 },
  { 1, -1 },
}

data:extend(
{
    discharger,
    charger,
    living_wall,
    radar_mk2,
    robocharger,
    {
      type = "car",
      name = "brr",
      collision_mask = {},
      equipment_grid = "brr-equipment-grid",
      icon = "__kupil-mujik-shlyapu__/graphics/icons/brr.png",
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
      effectivity = 5,
      braking_power = "1000kW",
      burner =
      {
        fuel_category = "fish-fuel",
        effectivity = 10,
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
      water_reflection = spitter_water_reflection(scale_spitter_behemoth)
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
  
})