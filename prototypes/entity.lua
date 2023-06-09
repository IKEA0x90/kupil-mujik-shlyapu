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

local steel_pipe = table.deepcopy(data.raw["pipe"]["pipe"])
steel_pipe.name = "steel-pipe"
steel_pipe.minable = {mining_time = 0.05, result = "steel-pipe"}
steel_pipe.fluid_box =
{
  base_area = 2,
  pipe_connections =
  {
    { position = {0, -1} },
    { position = {1, 0} },
    { position = {0, 1} },
    { position = {-1, 0} }
  }
}
steel_pipe.icon = "__kupil-mujik-shlyapu__/graphics/icons/steel-pipe.png"
for _, picture in pairs(steel_pipe.pictures) do
  picture.tint = {r=94/255, g=94/255, b=94/255, a=1}
  if picture.hr_version then
    picture.hr_version.tint = {r=94/255, g=94/255, b=94/255, a=1}
  end
end

local steel_undergound_pipe = table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"])
steel_undergound_pipe.name = "steel-pipe-to-ground"
steel_undergound_pipe.minable = {mining_time = 0.05, result = "steel-pipe-to-ground"}
steel_undergound_pipe.fluid_box.base_area = 2
steel_undergound_pipe.fluid_box.pipe_connections[2].max_underground_distance = 20
steel_undergound_pipe.icon = "__kupil-mujik-shlyapu__/graphics/icons/steel-pipe-to-ground.png"

steel_undergound_pipe.fluid_box.pipe_covers.north.layers[1].tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_undergound_pipe.fluid_box.pipe_covers.north.layers[1].hr_version.tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_undergound_pipe.fluid_box.pipe_covers.east.layers[1].tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_undergound_pipe.fluid_box.pipe_covers.east.layers[1].hr_version.tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_undergound_pipe.fluid_box.pipe_covers.south.layers[1].tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_undergound_pipe.fluid_box.pipe_covers.south.layers[1].hr_version.tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_undergound_pipe.fluid_box.pipe_covers.west.layers[1].tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_undergound_pipe.fluid_box.pipe_covers.west.layers[1].hr_version.tint = {r=94/255, g=94/255, b=94/255, a=1}

steel_undergound_pipe.pictures.up.tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_undergound_pipe.pictures.up.hr_version.tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_undergound_pipe.pictures.down.tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_undergound_pipe.pictures.down.hr_version.tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_undergound_pipe.pictures.left.tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_undergound_pipe.pictures.left.hr_version.tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_undergound_pipe.pictures.right.tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_undergound_pipe.pictures.right.hr_version.tint = {r=94/255, g=94/255, b=94/255, a=1}

local steel_reserv = table.deepcopy(data.raw["storage-tank"]["storage-tank"])
steel_reserv.name = "steel-storage-tank"
steel_reserv.minable = {mining_time = 0.5, result = "steel-storage-tank"}
steel_reserv.fluid_box.base_area = 500
steel_reserv.pictures.picture.sheets[1].tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_reserv.pictures.picture.sheets[1].hr_version.tint = {r=94/255, g=94/255, b=94/255, a=1}

steel_reserv.fluid_box.pipe_covers.north.layers[1].tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_reserv.fluid_box.pipe_covers.north.layers[1].hr_version.tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_reserv.fluid_box.pipe_covers.east.layers[1].tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_reserv.fluid_box.pipe_covers.east.layers[1].hr_version.tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_reserv.fluid_box.pipe_covers.south.layers[1].tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_reserv.fluid_box.pipe_covers.south.layers[1].hr_version.tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_reserv.fluid_box.pipe_covers.west.layers[1].tint = {r=94/255, g=94/255, b=94/255, a=1}
steel_reserv.fluid_box.pipe_covers.west.layers[1].hr_version.tint = {r=94/255, g=94/255, b=94/255, a=1}

data:extend(
{
    discharger,
    charger,
    living_wall,
    radar_mk2,
    robocharger,
    steel_pipe,
    steel_undergound_pipe,
    steel_reserv
})