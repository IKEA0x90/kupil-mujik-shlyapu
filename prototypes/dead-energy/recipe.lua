data:extend({
  {
    type = "recipe",
    name = "dead-matter-dissolving",
    category = "chemistry",
    energy_required = 12,
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
    crafting_machine_tint =
    {
      --[[
      primary = Main Liqud
      secondary = Secondary liquid
      tertiary = Top smoke
      quaternary = Bottom smoke
      ]]--
      base_color = {r=1, g=0, b=0, a = 1.0},
      secondary = {r=92/255, g=1, b=63/255, a = 1.000},
      tertiary = {r=0.5, g=0.5, b=0.5, a = 1.0},
      quaternary = {r=0, g=1, b=1, a = 1.0},
    },
    results=
    {
      {type="fluid", name="dead-matter-solution", amount=100}
    },
    icon = "__kupil-mujik-shlyapu__/graphics/icons/solution.png",
    icon_size = 64,
    order = "z[dead-matter-dissolving]",
    enabled = false
  },
  {
    type = "recipe",
    name = "bad-bronze",
    category = "chemistry",
    energy_required = 1,
    hide_from_player_crafting = true,
    ingredients =
    {
      {
        type="fluid", 
        name="molten-copper", 
        amount=10
      },
      {
        type="fluid", 
        name="molten-iron", 
        amount=10
      }
    },
    crafting_machine_tint =
    {
      --[[
      primary = Main Liqud
      secondary = Secondary liquid
      tertiary = Top smoke
      quaternary = Bottom smoke
      ]]--
      base_color = {r=220/255, g=192/255, b=110/255, a = 1.0},
      secondary = {r=141/255, g=141/255, b=141/255, a = 1.000},
      tertiary = {r=0, g=0, b=0, a = 0.5},
      quaternary = {r=0, g=0, b=0, a = 1.0},
    },
    results=
    {
      {type="fluid", name="bad-bronze", amount=20}
    },
    icon = "__kupil-mujik-shlyapu__/graphics/icons/bad-bronze.png",
    icon_size = 64,
    order = "z[bad-bronze]",
    enabled = true
  },
  {
    type = "recipe",
    name = "copper-iron",
    category = "smelting",
    energy_required = 2,
    hide_from_player_crafting = true,
    ingredients =
    {
        {type="fluid", name="bad-bronze", amount=2}
    },
    results=
    {
        {type="item", name="copper-iron-plate", amount=1, probability = 0.5},
        {type="item", name="iron-copper-plate", amount=1, probability = 0.5},
    },
    icon = "__kupil-mujik-shlyapu__/graphics/icons/bad-bronze.png",
    icon_size = 64,
    order = "z[bad-bronze]",
    enabled = true
  },
  {
    type = "recipe",
    name = "dead-plate",
    category = "smelting",
    energy_required = 24,
    hide_from_player_crafting = true,
    ingredients =
    {
        {type="item", name="copper-iron-plate", amount=100},
        {type="item", name="iron-copper-plate", amount=100},
        {type="fluid", name="dead-matter-solution", amount=100}
    },
    results=
    {
        {type="item", name="dead-plate", amount=2},
    },
    icon = "__kupil-mujik-shlyapu__/graphics/icons/bad-bronze.png",
    icon_size = 64,
    order = "z[bad-bronze]",
    enabled = false
  },
  {
    type = "recipe",
    name = "dead-fuel-cell",
    energy_required = 240,
    enabled = false,
    category = "centrifuging",
    ingredients = {{"dead-plate", 10}, {"rocket-control-unit", 1}},
    icon = "__base__/graphics/icons/dead-matter-fuel-cell.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "z[dead-matter-processing]-z[cell]",
    results = {{"dead-fuel-cell", 10}},
    allow_decomposition = false
  },
  
})