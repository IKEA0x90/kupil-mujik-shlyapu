local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

-- matter-plant

data:extend({
    {
        type = "item",
        name = "utopia-portal",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/portal.png",
        icon_size = 128, icon_mipmaps = 4,
        subgroup = "utopia",
        order = "z-portal",
        stack_size = 1,
        place_result = "utopia-portal"
    },
    {
        type = "recipe",
        name = "fesh",
        energy_required = 1,
        category = "fish-consume",
        ingredients =
        {
          {"raw-fish", 1},
        },
        results =
        {
          {type="item", name="raw-fish", amount=1, probability = 0},
        },
        subgroup = "intermediate-product",
        order = "a",
        enabled = true,
        hide_from_player_crafting = true,
        allow_inserter_overload = false
    },
    {
        type = "recipe-category",
        name = "fish-consume",
        localised_name = "Fesh",
        localised_description = "feshfesh"
    },
    {
    type = "furnace",
    name = "utopia-portal",
    icon = "__kupil-mujik-shlyapu__/graphics/icons/portal.png",
    icon_size = 128,
    icon_mipmaps = 4,
    flags = {
      "placeable-player",
      "placeable-neutral",
      "player-creation",
      "not-blueprintable",
      "no-copy-paste",
      "not-upgradable",
      "placeable-off-grid",
      },
    minable = { mining_time = 5, result = "utopia-portal" },
    max_health = 3000,
    damaged_trigger_effect = hit_effects.entity(),
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances = {
      { type = "physical", percent = 60 },
      { type = "fire", percent = 70 },
      { type = "impact", percent = 70 },
    },
    collision_box = { { -3.25, -3.25 }, { 3.25, 3.25 } },
    selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
    animation = {
      layers = {
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/portal/hr-matter-plant.png",
            priority = "high",
            width = 462,
            height = 500,
            frame_count = 1,
            shift = { -0.1, -0.2 },
            scale = 0.5,
        },
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/portal/hr-matter-plant-sh.png",
            priority = "high",
            width = 504,
            height = 444,
            frame_count = 1,
            draw_as_shadow = true,
            shift = { 0.23, 0.24 },
            scale = 0.5,
        },
      },
    },
    working_visualisations = {
      {
        draw_as_light = true,
        blend_mode = "additive-soft",
        animation = {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/portal/hr-matter-plant-working-light.png",
            priority = "high",
            width = 462,
            height = 500,
            frame_count = 30,
            line_length = 6,
            shift = { -0.1, -0.2 },
            scale = 0.5,
            animation_speed = 0.75,
        },
      },
      {
        draw_as_glow = true,
        blend_mode = "additive-soft",
        synced_fadeout = true,
        animation = {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/portal/hr-matter-plant-working-glow.png",
            priority = "high",
            width = 462,
            height = 500,
            frame_count = 30,
            line_length = 6,
            shift = { -0.1, -0.2 },
            scale = 0.5,
            animation_speed = 0.75,
        },
      },
      {
        animation = {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/portal/hr-matter-plant-working.png",
            width = 462,
            height = 500,
            frame_count = 30,
            line_length = 6,
            shift = { -0.1, -0.2 },
            scale = 0.5,
            animation_speed = 0.75,
        },
      },
    },
    crafting_categories = {"fish-consume"},
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = { filename = "__kupil-mujik-shlyapu__/graphics/entity/portal/matter-plant.ogg" },
      idle_sound = { filename = "__base__/sound/idle1.ogg" },
      apparent_volume = 1.5,
    },
    energy_usage = "1W",
    allowed_effects = {"pollution"},
    result_inventory_size = 1,
    source_inventory_size = 1,
    energy_source =
    {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = 0,
    drain = "30MW",
    buffer_capacity = "1J"   
    },
    return_ingredients_on_change = false,
    module_specification = { module_slots = 5 },
    open_sound = { filename = "__kupil-mujik-shlyapu__/graphics/entity/open.ogg", volume = 1 },
    close_sound = { filename = "__kupil-mujik-shlyapu__/graphics/entity/close.ogg", volume = 0.85 },
    crafting_speed = 1,
  },
})

data:extend({
	{
		type = "custom-input",
		name = "teleport",
		key_sequence = "SHIFT + T",
		action = "lua"
	},
})


data:extend({
	{
		type = "sprite",
		name = "teleport-button",
		filename = "__kupil-mujik-shlyapu__/graphics/icons/teleport.png",
		size = 256,
	},
})

data:extend({
    {
      type = "shortcut",
      name = "teleport",
      toggleable = true,
      localised_name = { "strings.teleport"},
	  localised_description = {"stringsdesc.teleport"},
      order = "a",
      action = "lua",
      icon = {
        filename = "__kupil-mujik-shlyapu__/graphics/icons/teleport.png",
        flags = {
          "icon"
        },
        priority = "extra-high-no-scale",
        size = 256
      },
    },
  })

  local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

data:extend({
  {
    type = "radar",
    name = "portal-port",
    icon = "__kupil-mujik-shlyapu__/graphics/icons/port.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = {
        "placeable-player",
        "placeable-neutral",
        "player-creation",
        "not-repairable",
        "not-blueprintable",
        "not-deconstructable",
        "hidden",
        "hide-alt-info",
        "no-copy-paste",
        "not-upgradable",
        "placeable-off-grid",
    },
    damaged_trigger_effect = hit_effects.entity(),
    max_health = 1000,
    corpse = "small-remnants",
    resistances = {
      {
        type = "fire",
        percent = 50,
      },
      {
        type = "impact",
        percent = 10,
      },
    },
    collision_box = { { -0.25, -0.25 }, { 0.25, 0.25 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    energy_per_sector = "16MJ",
    energy_per_nearby_scan = "128kJ",
    max_distance_of_sector_revealed = 20,
    max_distance_of_nearby_sector_revealed = 3,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
    },
    energy_usage = "500kW",
    pictures = {
      layers = {
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/port/hr-sentinel.png",
            priority = "low",
            width = 128,
            height = 128,
            apply_projection = false,
            direction_count = 120,
            line_length = 12,
            shift = { 0.21, -0.2 },
            scale = 0.35,
        },
      },
    },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = { filename = "__kupil-mujik-shlyapu__/graphics/entity/port/sentinel.ogg" },
      apparent_volume = 1,
    },
    radius_minimap_visualisation_color = { r = 0, g = 1, b = 0, a = 0.275 },
    rotation_speed = 0.0015,
    is_military_target = true
  },
})
