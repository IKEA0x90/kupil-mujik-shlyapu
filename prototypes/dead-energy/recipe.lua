data:extend({
  {
    type = "recipe",
    name = "dead-matter-dissolving",
    category = "chemistry",
    energy_required = 6,
    hide_from_player_crafting = true,
    ingredients =
    {
      {"dead-matter", 100},
      {"uranium-ore", 10},
      {
        type="fluid", 
        name="water", 
        amount=100
      }
    },
    crafting_machine_tint = --TODO
    {
      --[[
      primary = Main Liqud
      secondary = Secondary liquid
      tertiary = Top smoke
      quaternary = Bottom smoke
      ]]--
      base_color = {r=242/255, g=129/255, b=1, a = 1.0},
      secondary = {r=1, g=0, b=0, a = 1.000},
      tertiary = {r=242/255, g=129/255, b=1, a = 1.0},
      quaternary = {r=1, g=0, b=0, a = 1.0},
    },
    results=
    {
      {type="fluid", name="dead-matter-solution", amount=100}
    },
    icon = "__kupil-mujik-shlyapu__/graphics/icons/", --TODO
    icon_size = 64,
    order = "z[dead-matter-dissolving]",
    enabled = false
  },
  
})