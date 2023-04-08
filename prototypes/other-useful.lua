data:extend({
  {
    type = "fluid",
    name = "gamer-juice",
    default_temperature = 0,
    max_temperature = 100,
    heat_capacity = "100KJ",
    base_color = {r=242/255, g=129/255, b=1},
    flow_color = {r=242/255, g=129/255, b=1},
    icon = "__kupil-mujik-shlyapu__/graphics/icons/gamer.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "z[gamer-juice]"
  },
  {
    type = "fluid",
    name = "samurai-tears",
    default_temperature = 0,
    max_temperature = 100,
    heat_capacity = "100KJ",
    base_color = {r=146/255, g=249/255, b=239/255},
    flow_color = {r=211/255, g=246/255, b=1},
    icon = "__kupil-mujik-shlyapu__/graphics/icons/tear.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "z[samurai-tears]"
  },
  {
    type = "fluid",
    name = "molten-fish",
    default_temperature = 50,
    max_temperature = 1000,
    heat_capacity = "1J",
    base_color = {r=190/255, g=205/255, b=122/255},
    flow_color = {r=247/255, g=170/255, b=112/255},
    icon = "__kupil-mujik-shlyapu__/graphics/icons/molten.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "z[molten-fish]"
},
  {
    type = "equipment-grid",
    name = "brr-equipment-grid",
    width = 10,
    height = 8,
    equipment_categories = {"armor"}
  },
  {
    type = "projectile",
    name = "treenade",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "create-entity",
          show_in_tooltip = true,
          entity_name = "tree-01",
          offsets = {{-0.7, -0.7},{-0.7, 0.7},{0.7, -0.7},{0.7, 0.7},{0, 0}},
          offset_deviation = {{-0.4, -0.4}, {0.4, 0.4}},
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__kupil-mujik-shlyapu__/graphics/entity/tree_capsule_projectile.png",
      frame_count = 16,
      line_length = 8,
      animation_speed = 0.250,
      width = 58,
      height = 59,
      shift = util.by_pixel(1, 0.5),
      priority = "high",
      scale = 0.5
    },
    shadow =
    {
      filename = "__base__/graphics/entity/poison-capsule/hr-poison-capsule-shadow.png",
      frame_count = 16,
      line_length = 8,
      animation_speed = 0.250,
      width = 54,
      height = 42,
      shift = util.by_pixel(1, 2),
      priority = "high",
      draw_as_shadow = true,
      scale = 0.5
    },
    smoke =
    {
      {
        name = "poison-capsule-smoke",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 0},
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed_deviation = 5
      }
    }
  },
  {
    type = "recipe-category",
    name = "sus-battery",
    localised_name = "An interesting way to store energy",
    localised_description = "It came to me in my sleep"
  },

})