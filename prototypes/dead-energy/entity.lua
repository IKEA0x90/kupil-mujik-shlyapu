require ("util")

function make_heat_pipe_pictures(path, name_prefix, data, draw_as_glow)
    local all_pictures = {}
    local func = draw_as_glow and apply_heat_pipe_glow or function(t) return t end
    for key, t in pairs(data) do
      if t.empty then
        all_pictures[key] = { priority = "extra-high", filename = "__core__/graphics/empty.png", width = 1, height = 1 }
      else
        local tile_pictures = {}
        for i = 1, (t.variations or 1) do
          local sprite = func
          {
            priority = "extra-high",
            filename = path .. name_prefix .. "-" .. (t.name or string.gsub(key, "_", "-")) .. (t.ommit_number and ".png" or ("-" .. tostring(i) .. ".png")),
            width = (t.width or 32),
            height = (t.height or 32),
            shift = t.shift,
            tint = {r=48/255, g=165/255 , b=167/255, a=1},
            hr_version =
            {
              priority = "extra-high",
              filename = path .. "hr-" .. name_prefix .. "-" .. (t.name or string.gsub(key, "_", "-")) .. (t.ommit_number and ".png" or ("-" .. tostring(i) .. ".png")),
              width = (t.width or 32) * 2,
              height = (t.height or 32) * 2,
              tint = {r=48/255, g=165/255 , b=167/255, a=1},
              scale = 0.5,
              shift = t.shift
            }
          }
          table.insert(tile_pictures, sprite)
        end
        all_pictures[key] = tile_pictures
      end
    end
    return all_pictures
end

local heated_pipes_tint = {r=48/255, g=165/255 , b=167/255, a=0.5}
local heat_glow_tint = {1, 1, 1, 1}
  
local apply_heat_pipe_glow = function(layer)
    layer.tint = heated_pipes_tint
    if layer.hr_version then
      layer.hr_version.tint = heated_pipes_tint
    end
    local light_layer = util.copy(layer)
    light_layer.draw_as_light = true
    light_layer.tint = heat_glow_tint
    if light_layer.hr_version then
      light_layer.hr_version.draw_as_light = true
      light_layer.hr_version.tint = heat_glow_tint
    end
    return
    {
      layers =
      {
        layer,
        light_layer
      }
    }
end

function make_4way_animation_from_spritesheet(animation)
    local function make_animation_layer(idx, anim)
      local start_frame = (anim.frame_count or 1) * idx
      local x = 0
      local y = 0
      if anim.line_length then
        y = anim.height * math.floor(start_frame / (anim.line_length or 1))
      else
        x = idx * anim.width
      end
      return
      {
        filename = anim.filename,
        priority = anim.priority or "high",
        flags = anim.flags,
        x = x,
        y = y,
        width = anim.width,
        height = anim.height,
        frame_count = anim.frame_count or 1,
        line_length = anim.line_length,
        repeat_count = anim.repeat_count,
        shift = anim.shift,
        draw_as_shadow = anim.draw_as_shadow,
        force_hr_shadow = anim.force_hr_shadow,
        apply_runtime_tint = anim.apply_runtime_tint,
        animation_speed = anim.animation_speed,
        scale = anim.scale or 1,
        tint = anim.tint,
        blend_mode = anim.blend_mode
      }
    end
  
    local function make_animation_layer_with_hr_version(idx, anim)
      local anim_parameters = make_animation_layer(idx, anim)
      if anim.hr_version and anim.hr_version.filename then
        anim_parameters.hr_version = make_animation_layer(idx, anim.hr_version)
      end
      return anim_parameters
    end
  
    local function make_animation(idx)
      if animation.layers then
        local tab = { layers = {} }
        for k,v in ipairs(animation.layers) do
          table.insert(tab.layers, make_animation_layer_with_hr_version(idx, v))
        end
        return tab
      else
        return make_animation_layer_with_hr_version(idx, animation)
      end
    end
  
    return
    {
      north = make_animation(0),
      east = make_animation(1),
      south = make_animation(2),
      west = make_animation(3)
    }
end

local heat_tears =  table.deepcopy(data.raw["boiler"]["heat-exchanger"])
heat_tears.name = "kettle"
heat_tears.mode = "output-to-separate-pipe"
heat_tears.minable = {mining_time = 0.1, result = "kettle"}
heat_tears.target_temperature = 1200
heat_tears.fluid_box =
{
  base_area = 2,
  height = 2,
  base_level = -1,
  pipe_covers = pipecoverspictures(),
  pipe_connections =
  {
    {type = "input-output", position = {-2, 0.5}},
    {type = "input-output", position = {2, 0.5}}
  },
  production_type = "input-output",
  filter = "samurai-tears"
}
heat_tears.output_fluid_box =
{
  base_area = 2,
  height = 2,
  base_level = 1,
  pipe_covers = pipecoverspictures(),
  pipe_connections =
  {
    {type = "output", position = {0, -1.5}}
  },
  production_type = "output",
  filter = "samurai-tears"
}
heat_tears.energy_source.max_temperature = 2000
heat_tears.energy_source.min_working_temperature = 1000
heat_tears.energy_source.minimum_glow_temperature = 500
heat_tears.energy_consumption = "100MW"

heat_tears.pipe_covers =
    make_4way_animation_from_spritesheet(
        {
        filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
        width = 32,
        height = 32,
        direction_count = 4,
        tint = {r=48/255, g=165/255 , b=167/255, a=1},
        hr_version =
        {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-endings.png",
            width = 64,
            tint = {r=48/255, g=165/255 , b=167/255, a=1},
            height = 64,
            direction_count = 4,
            scale = 0.5
        }
        })

heat_tears.heat_pipe_covers =
    make_4way_animation_from_spritesheet(
        apply_heat_pipe_glow{
        filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
        width = 32,
        tint = {r=48/255, g=165/255 , b=167/255, a=1},
        height = 32,
        direction_count = 4,
        hr_version =
        {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-endings-heated.png",
            width = 64,
            tint = {r=48/255, g=165/255 , b=167/255, a=1},
            height = 64,
            direction_count = 4,
            scale = 0.5
        }
        })

heat_tears.heat_picture =
{
    north = apply_heat_pipe_glow
        {
        filename = "__base__/graphics/entity/heat-exchanger/heatex-N-heated.png",
        priority = "extra-high",
        width = 24,
        height = 48,
        tint = {r=48/255, g=165/255 , b=167/255, a=1},
        shift = util.by_pixel(-1, 8),
        hr_version =
        {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-N-heated.png",
            priority = "extra-high",
            width = 44,
            height = 96,
            shift = util.by_pixel(-0.5, 8.5),
            tint = {r=48/255, g=165/255 , b=167/255, a=1},
            scale = 0.5
        }
        },
    east = apply_heat_pipe_glow
        {
        filename = "__base__/graphics/entity/heat-exchanger/heatex-E-heated.png",
        priority = "extra-high",
        width = 40,
        tint = {r=48/255, g=165/255 , b=167/255, a=1},
        height = 40,
        shift = util.by_pixel(-21, -13),
        hr_version =
        {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-E-heated.png",
            priority = "extra-high",
            width = 80,
            tint = {r=48/255, g=165/255 , b=167/255, a=1},
            height = 80,
            shift = util.by_pixel(-21, -13),
            scale = 0.5
        }
        },
    south = apply_heat_pipe_glow
        {
        filename = "__base__/graphics/entity/heat-exchanger/heatex-S-heated.png",
        priority = "extra-high",
        width = 16,
        tint = {r=48/255, g=165/255 , b=167/255, a=1},
        height = 20,
        shift = util.by_pixel(-1, -30),
        hr_version =
        {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-S-heated.png",
            priority = "extra-high",
            width = 28,
            tint = {r=48/255, g=165/255 , b=167/255, a=1},
            height = 40,
            shift = util.by_pixel(-1, -30),
            scale = 0.5
        }
        },
    west = apply_heat_pipe_glow
        {
        filename = "__base__/graphics/entity/heat-exchanger/heatex-W-heated.png",
        priority = "extra-high",
        width = 32,
        tint = {r=48/255, g=165/255 , b=167/255, a=1},
        height = 40,
        shift = util.by_pixel(23, -13),
        hr_version =
        {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-W-heated.png",
            priority = "extra-high",
            width = 64,
            tint = {r=48/255, g=165/255 , b=167/255, a=1},
            height = 76,
            shift = util.by_pixel(23, -13),
            scale = 0.5
        }
}
}

local consume_tears = table.deepcopy(data.raw["generator"]["steam-turbine"])
consume_tears.name = "china"
consume_tears.minable = {mining_time = 0.1, result = "china"}
consume_tears.fluid_box =
{
  base_area = 1,
  height = 2,
  base_level = -1,
  pipe_covers = pipecoverspictures(),
  pipe_connections =
  {
    { type = "input-output", position = {0, 3} },
    { type = "input-output", position = {0, -3} }
  },
  production_type = "input-output",
  filter = "samurai-tears",
  minimum_temperature = 1200.0,
  maximum_temperature = 1200.0,
}
consume_tears.smoke =
{
  {
    name = "cyan-smoke-big",
    north_position = {0.0, -1.0},
    east_position = {0.75, -0.75},
    frequency = 10 / 32,
    starting_vertical_speed = 0.08,
    slow_down_factor = 1,
    starting_frame_deviation = 60
  }
}
consume_tears.fluid_usage_per_tick = 1/60
consume_tears.maximum_temperature = 1200

local dead_reactor = table.deepcopy(data.raw["reactor"]["nuclear-reactor"])
dead_reactor.name = "dead-reactor"
dead_reactor.minable = {mining_time = 0.5, result = "dead-reactor"}
dead_reactor.working_light_picture =     {
  filename = "__kupil-mujik-shlyapu__/graphics/entity/nuclear-reactor/reactor-lights-color.png",
  blend_mode = "additive",
  draw_as_glow = true,
  width = 160,
  height = 160,
  shift = { -0.03125, -0.1875 },
  hr_version =
  {
    filename = "__kupil-mujik-shlyapu__/graphics/entity/nuclear-reactor/hr-reactor-lights-color.png",
    blend_mode = "additive",
    draw_as_glow = true,
    width = 320,
    height = 320,
    scale = 0.5,
    shift = { -0.03125, -0.1875 },
  }
}
dead_reactor.heat_buffer.max_temperature = 2000
dead_reactor.consumption = "200MW"
dead_reactor.neighbour_bonus = 0.75
dead_reactor.energy_source.fuel_category = "dead-fuel"
dead_reactor.meltdown_action =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
          repeat_count = 100,
          type = "create-trivial-smoke",
          smoke_name = "nuclear-smoke",
          offset_deviation = {{-1, -1}, {1, 1}},
          starting_frame = 3,
          starting_frame_deviation = 5,
          starting_frame_speed = 0,
          starting_frame_speed_deviation = 5,
          speed_from_center = 0.5
      },
      {
        type = "create-entity",
        entity_name = "explosion"
      },
      {
        type = "damage",
        damage = {amount = 400, type = "explosion"}
      },
      {
        type = "create-entity",
        entity_name = "small-scorchmark",
        check_buildability = true
      },
      {
        type = "nested-result",
        action =
        {
          type = "area",
          target_entities = false,
          trigger_from_target = true,
          repeat_count = 10,
          radius = 100,
          action_delivery =
          {
            type = "projectile",
            projectile = "atomic-rocket",
            starting_speed = 0.5
          }
        }
      },
      {
        type = "nested-result",
        action =
        {
          type = "area",
          target_entities = false,
          trigger_from_target = true,
          repeat_count = 30,
          radius = 100,
          action_delivery =
          {
            type = "projectile",
            projectile = "long-smoke-projectile",
            starting_speed = 0.5
          }
        }
      },
    }
  }
}

dead_reactor.lower_layer_picture =
{
  filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes.png",
  width = 156,
  tint = {r=48/255, g=165/255 , b=167/255, a=1},
  height = 156,
  shift = util.by_pixel(-2, -4),
  hr_version =
  {
    filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-pipes.png",
    width = 320,
    height = 316,
    tint = {r=48/255, g=165/255 , b=167/255, a=1},
    scale = 0.5,
    shift = util.by_pixel(-1, -5)
  }
}
dead_reactor.heat_lower_layer_picture = apply_heat_pipe_glow
{
  filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes-heated.png",
  width = 156,
  height = 156,
  tint = {r=48/255, g=165/255 , b=167/255, a=1},
  shift = util.by_pixel(-3, -4),
  hr_version =
  {
    filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-pipes-heated.png",
    width = 320,
    height = 316,
    scale = 0.5,
    tint = {r=48/255, g=165/255 , b=167/255, a=1},
    shift = util.by_pixel(-0.5, -4.5)
  }
}
dead_reactor.heat_buffer.heat_picture = apply_heat_pipe_glow
{
  filename = "__base__/graphics/entity/nuclear-reactor/reactor-heated.png",
  width = 108,
  tint = {r=48/255, g=165/255 , b=167/255, a=1},
  height = 128,
  shift = util.by_pixel(1, -7),
  hr_version =
  {
    filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-heated.png",
    width = 216,
    height = 256,
    tint = {r=48/255, g=165/255 , b=167/255, a=1},
    scale = 0.5,
    shift = util.by_pixel(3, -6.5)
  }
}
dead_reactor.connection_patches_connected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        tint = {r=48/255, g=165/255 , b=167/255, a=1},
        variation_count = 12,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
          width = 64,
          tint = {r=48/255, g=165/255 , b=167/255, a=1},
          height = 64,
          variation_count = 12,
          scale = 0.5
        }
      }
    }

dead_reactor.connection_patches_disconnected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        tint = {r=48/255, g=165/255 , b=167/255, a=1},
        variation_count = 12,
        y = 32,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
          width = 64,
          tint = {r=48/255, g=165/255 , b=167/255, a=1},
          height = 64,
          variation_count = 12,
          y = 64,
          scale = 0.5
        }
      }
    }

dead_reactor.heat_connection_patches_connected =
    {
      sheet = apply_heat_pipe_glow
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
        width = 32,
        height = 32,
        tint = {r=48/255, g=165/255 , b=167/255, a=1},
        variation_count = 12,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches-heated.png",
          width = 64,
          height = 64,
          tint = {r=48/255, g=165/255 , b=167/255, a=1},
          variation_count = 12,
          scale = 0.5
        }
      }
    }

dead_reactor.heat_connection_patches_disconnected =
    {
      sheet = apply_heat_pipe_glow
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
        width = 32,
        tint = {r=48/255, g=165/255 , b=167/255, a=1},
        height = 32,
        variation_count = 12,
        y = 32,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches-heated.png",
          width = 64,
          tint = {r=48/255, g=165/255 , b=167/255, a=1},
          height = 64,
          variation_count = 12,
          y = 64,
          scale = 0.5
        }
      }
    }

local glass_pipe =  table.deepcopy(data.raw["heat-pipe"]["heat-pipe"])
glass_pipe.name = "glass-pipe"
glass_pipe.minable = {mining_time = 0.1, result = "glass-pipe"}
glass_pipe.connection_sprites = make_heat_pipe_pictures("__base__/graphics/entity/heat-pipe/", "heat-pipe",
{
  single = { name = "straight-vertical-single", ommit_number = true },
  straight_vertical = { variations = 6 },
  straight_horizontal = { variations = 6 },
  corner_right_up = { name = "corner-up-right", variations = 6 },
  corner_left_up = { name = "corner-up-left", variations = 6 },
  corner_right_down = { name = "corner-down-right", variations = 6 },
  corner_left_down = { name = "corner-down-left", variations = 6 },
  t_up = {},
  t_down = {},
  t_right = {},
  t_left = {},
  cross = { name = "t" },
  ending_up = {},
  ending_down = {},
  ending_right = {},
  ending_left = {}
})

glass_pipe.heat_glow_sprites = make_heat_pipe_pictures("__base__/graphics/entity/heat-pipe/", "heated",
{
  single = { empty = true },
  straight_vertical = { variations = 6 },
  straight_horizontal = { variations = 6 },
  corner_right_up = { name = "corner-up-right", variations = 6 },
  corner_left_up = { name = "corner-up-left", variations = 6 },
  corner_right_down = { name = "corner-down-right", variations = 6 },
  corner_left_down = { name = "corner-down-left", variations = 6 },
  t_up = {},
  t_down = {},
  t_right = {},
  t_left = {},
  cross = { name = "t" },
  ending_up = {},
  ending_down = {},
  ending_right = {},
  ending_left = {}
}, true)

glass_pipe.heat_buffer.max_temperature = 2000

local dead_converter = table.deepcopy(data.raw["burner-generator"]["burner-generator"])
dead_converter.name = "dead-converter"
dead_converter.flags = {"placeable-off-grid", "player-creation", "breaths-air", "not-repairable", "not-blueprintable", "not-deconstructable", "not-upgradable" }
dead_converter.icon = data.raw["turret"]["medium-worm-turret"].icon
dead_converter.corpse = data.raw["turret"]["medium-worm-turret"].remnants
dead_converter.collision_box = data.raw["turret"]["medium-worm-turret"].collision_box
dead_converter.selection_box = data.raw["turret"]["medium-worm-turret"].selection_box
dead_converter.drawing_box = data.raw["turret"]["medium-worm-turret"].drawing_box
dead_converter.max_power_output = "1000W"
dead_converter.minable = nil
dead_converter.animation = data.raw["turret"]["medium-worm-turret"].prepared_animation
dead_converter.burner = {
  fuel_category = "fish-fuel",
    effectivity = 0.5,
    fuel_inventory_size = 1,
    burnt_inventory_size = 1,
    emissions_per_minute = 0,
    smoke =
    {
      {
        name = "cyan-smoke-big",
        north_position = {0.0, 0.0},
        east_position = {0.0, 0.0},
        deviation = {0.1, 0.1},
        frequency = 1
      }
    }
}

local gamer = table.deepcopy(data.raw["logistic-robot"]["logistic-robot"])
gamer.name = "dead-logistic-drone"
gamer.minable = { mining_time = 0.05, result = "dead-logistic-drone" }
gamer.speed = 0.25
gamer.max_energy = "4MJ"
gamer.idle = spitterrunanimation(0.3, {r=146/255, g=249/255, b=239/255}, {r=146/255, g=249/255, b=239/255})
gamer.idle.hr_version = spitterrunanimation(0.3, {r=146/255, g=249/255, b=239/255}, {r=146/255, g=249/255, b=239/255})
gamer.idle_with_cargo = spitterrunanimation(0.3, {r=146/255, g=249/255, b=239/255}, {r=146/255, g=249/255, b=239/255})
gamer.idle_with_cargo.hr_version = spitterrunanimation(0.3, {r=146/255, g=249/255, b=239/255}, {r=146/255, g=249/255, b=239/255})
gamer.in_motion = spitterrunanimation(0.3, {r=146/255, g=249/255, b=239/255}, {r=146/255, g=249/255, b=239/255})
gamer.in_motion.hr_version = spitterrunanimation(0.3, {r=146/255, g=249/255, b=239/255}, {r=146/255, g=249/255, b=239/255})
gamer.in_motion_with_cargo = spitterrunanimation(0.3, {r=146/255, g=249/255, b=239/255}, {r=146/255, g=249/255, b=239/255})
gamer.in_motion_with_cargo.hr_version = spitterrunanimation(0.3, {r=146/255, g=249/255, b=239/255}, {r=146/255, g=249/255, b=239/255})

local gamer2 = table.deepcopy(data.raw["construction-robot"]["construction-robot"])
gamer2.name = "dead-construction-drone"
gamer2.minable = { mining_time = 0.05, result = "dead-construction-drone" }
gamer2.speed = 0.25
gamer2.max_energy = "4MJ"
gamer2.idle = biterrunanimation(0.3, {r=146/255, g=249/255, b=239/255}, {r=146/255, g=249/255, b=239/255})
gamer2.idle.hr_version = biterrunanimation(0.3, {r=146/255, g=249/255, b=239/255}, {r=146/255, g=249/255, b=239/255})
gamer2.in_motion = biterrunanimation(0.3, {r=146/255, g=249/255, b=239/255}, {r=146/255, g=249/255, b=239/255})
gamer2.in_motion.hr_version = biterrunanimation(0.3, {r=146/255, g=249/255, b=239/255}, {r=146/255, g=249/255, b=239/255})

data:extend(
{
    gamer,
    gamer2,
    dead_converter,
    heat_tears,
    consume_tears,
    dead_reactor,
    glass_pipe,
})