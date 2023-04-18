data:extend(
{
  {
    type = "recipe",
    name = "brr",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
      {"sulfur", 100},
      {"raw-fish", 20},
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
    name = "invisicar",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
      {"uranium-ore", 100},
      {"low-density-structure", 50},
      {"advanced-circuit", 50},
      {
        type="fluid", 
        name="steam", 
        amount=10000
      }
    },
    result = "invisicar",
    category="crafting-with-fluid",
    subgroup = "bullet"
  },
  {
    type = "recipe",
    name = "gamer-juice",
    category = "chemistry",
    energy_required = 1,
    hide_from_player_crafting = true,
    ingredients =
    {
      {
      type="fluid", 
      name="steam", 
      amount=200
      },
      {
      type="fluid", 
      name="lubricant", 
      amount=20
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
      base_color = {r=242/255, g=129/255, b=1, a = 1.0},
      secondary = {r=0, g=1, b=0, a = 1.000},
      tertiary = {r=0, g=1, b=0, a = 1.000},
      quaternary = {r=242/255, g=129/255, b=1, a = 1.0},
    },
    results=
    {
      {type="fluid", name="gamer-juice", amount=20}
    },
    icon = "__kupil-mujik-shlyapu__/graphics/icons/gamer.png",
    icon_size = 64,
    order = "z[gamer-juice]",
    enabled = true
  },
  {
    type = "recipe",
    name = "gamer-juice-heat",
    category = "chemistry",
    energy_required = 4,
    hide_from_player_crafting = true,
    ingredients =
    {
      {
      type="fluid", 
      name="se-pyroflux", 
      amount=10
      },
      {
      type="fluid", 
      name="gamer-juice", 
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
      base_color = {r=242/255, g=129/255, b=1, a = 1.0},
      secondary = {r=1, g=0, b=0, a = 1.000},
      tertiary = {r=242/255, g=129/255, b=1, a = 1.0},
      quaternary = {r=1, g=0, b=0, a = 1.0},
    },
    results=
    {
      {type="fluid", name="gamer-juice", amount=50, temperature = 100}
    },
    icon = "__kupil-mujik-shlyapu__/graphics/icons/gamer.png",
    icon_size = 64,
    order = "z[gamer-juice-z]",
    enabled = true
  },
  {
    type = "recipe",
    name = "samurai-tears",
    category = "chemistry",
    energy_required = 1,
    hide_from_player_crafting = true,
    ingredients =
    {
      {
      type="fluid", 
      name="molten-fish", 
      amount = 10
      },
      {
      type="fluid", 
      name="gamer-juice", 
      amount = 100,
      temperature = 100
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
      base_color = {r=146/255, g=249/255, b=239/255},
      secondary = {r=190/255, g=205/255, b=122/255},
      tertiary = {r=242/255, g=129/255, b=1, a = 1.0},
      quaternary = {r=247/255, g=170/255, b=112/255},
    },
    results=
    {
      {type="fluid", name="samurai-tears", amount=200}
    },
    icon = "__kupil-mujik-shlyapu__/graphics/icons/tear.png",
    icon_size = 64,
    order = "z[samurai-tears]a",
    enabled = true
  },
  {
    type = "recipe",
    name = "molten-fish",
    category = "smelting",
    energy_required = 0.5,
    hide_from_player_crafting = true,
    ingredients =
    {
      {
      name="raw-fish", 
      amount = 1,
      }
    },
    results=
    {
      {type="fluid", name="molten-fish", amount=10}
    },
    icon = "__kupil-mujik-shlyapu__/graphics/icons/molten.png",
    icon_size = 64,
    order = "z[molten-fish]",
    enabled = true
  },
  {
    type = "recipe",
    name = "interesting-battery",
    enabled = false,
    energy_required = 6,
    ingredients =
    {
      {"battery", 5},
      {type="fluid", name="gamer-juice", amount=50},
    },
    result = "interesting-battery",
    category="chemistry",
    subgroup = "chemistry",
    crafting_machine_tint =
    {
      --[[
      primary = Main Liqud
      secondary = Secondary liquid
      tertiary = Top smoke
      quaternary = Bottom smoke
      ]]--
      base_color = {r=1, g=0, b=0, a = 1.000},
      secondary = {r=1, g=0, b=1, a = 1.000},
      tertiary = {r=1, g=0, b=0, a = 1.000},
      quaternary = {r=1, g=0, b=1, a = 1.000},
    },
  },
  {
    type = "recipe",
    name = "interesting-battery-charged",
    enabled = false,
    energy_required = 100,
    ingredients =
    {
      {"interesting-battery", 1},
    },
    result = "interesting-battery-charged",
    category="sus-battery",
    subgroup = "chemistry"
  },
  {
    type = "recipe",
    name = "interesting-battery-discharger",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"iron-plate", 20},
      {"battery", 10},
      {"copper-plate", 20}
    },
    result = "interesting-battery-discharger",
    category="crafting",
    subgroup = "chemistry"
  },
  {
    type = "recipe",
    name = "interesting-battery-charger",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"iron-plate", 20},
      {"battery", 10},
      {"copper-plate", 20}
    },
    result = "interesting-battery-charger",
    category="crafting",
    subgroup = "chemistry"
  },
  {
    type = "recipe",
    name = "living-wall",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 1,
    ingredients =
      {
        {"sulfur", 1},
        {"landfill", 1},
        {type = "fluid", name = "samurai-tears", amount = 2}
      },
      results=
      {
        {type="item", name="living-wall", amount=10, probability = 1},
      },
  },
  {
    type = "recipe",
    enabled = false,
    name = "radar-mk2",
    ingredients =
    {
      {"electronic-circuit", 10},
      {"iron-gear-wheel", 10},
      {"iron-plate", 20},
      {"copper-plate", 20},
      {"steel-plate", 5}
    },
    result = "radar-mk2"
  },
  {
    type = "recipe",
    name = "robocharger",
    enabled = false,
    ingredients =
    {
      {"advanced-circuit", 10},
      {"interesting-battery-charged", 1},
      {"steel-plate", 20},
      {"accumulator", 2}
    },
    result = "robocharger"
  },
  {
    type = "recipe",
    enabled = false,
    name = "steel-pipe",
    ingredients =
    {
      {"steel-plate", 1},
    },
    result = "steel-pipe"
  },
  {
    type = "recipe",
    enabled = false,
    name = "steel-pipe-to-ground",
    ingredients =
    {
      {"steel-plate", 10},
      {"steel-pipe", 10}
    },
    result_count = 2,
    result = "steel-pipe-to-ground"
  },
  {
    type = "recipe",
    enabled = false,
    name = "steel-storage-tank",
    ingredients =
    {
      {"steel-plate", 25},
    },
    result = "steel-storage-tank"
  },
  {
    type = "recipe",
    name = "copper-cable-from-con",
    ingredients = {{"copper-iron-plate", 1}},
    result = "copper-cable",
    result_count = 4,
    enabled = false,
  },
  {
    type = "recipe",
    name = "iron-gear-wheel-from-iropper",
    ingredients = {{"iron-copper-plate", 1}},
    result = "iron-gear-wheel",
    result_count = 1,
    enabled = false,
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
    enabled = false
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
    enabled = false,
    subgroup = "raw-material",
  },

})