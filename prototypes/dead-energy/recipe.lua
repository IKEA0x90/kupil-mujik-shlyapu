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
    icon = "__kupil-mujik-shlyapu__/graphics/icons/dead-matter-fuel-cell.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "z[dead-matter-processing]-z[cell]",
    results = {{"dead-fuel-cell", 10}},
    allow_decomposition = false,
    crafting_machine_tint =
    {
      --[[
      primary = Main Liqud
      secondary = Secondary liquid
      tertiary = Top smoke
      quaternary = Bottom smoke
      ]]--
      base_color = {r=1, g=0, b=0, a = 1.0},
      secondary = {r=1, g=0, b=0, a = 1.0},
      tertiary = {r=1, g=0, b=0, a = 1.0},
      quaternary = {r=1, g=0, b=0, a = 1.0},
    },
  },
  {
    type = "recipe",
    name = "dead-data",
    energy_required = 100,
    enabled = false,
    category = "crafting",
    ingredients =
    {
      {"se-satellite-telemetry", 100},
      {"dead-data-prepare", 321},
    },
    result= "dead-data",
    requester_paste_multiplier = 1
  },
  {
    type = "recipe",
    name = "head-crab",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 20,
    ingredients =
      {
        {"dead-data-prepare", 100},
        {"light-oil-fish", 20},
        {"lubricant-fish-equipment", 20},
        {type = "fluid", name = "samurai-tears", amount = 600}
      },
      results=
      {
        {type="item", name="head-crab", amount=1, probability = 1},
      },
  },
  {
    type = "recipe",
    name = "dead-logistic-drone-ineffective",
    category = "chemistry",
    energy_required = 20,
    ingredients =
    {
      {
        type="fluid", 
        name="samurai-tears", 
        amount=200,
      },
      {"gamer-juice-fish", 3},
    },
    crafting_machine_tint =
    {
      primary = {r=146/255, g=249/255, b=239/255},
      secondary = {r=242/255, g=129/255, b=1},
      tertiary = {r=0, g=0, b=0, a = 0},
      quaternary = {r=0, g=0, b=0, a = 0},
    },
    results=
    {
      {type="item", name="dead-logistic-drone", amount=1, probability = 1},
    },
    icon = "__kupil-mujik-shlyapu__/graphics/icons/dead-l.png",
    icon_size = 64,
    order = "z[dead-robot-l]",
    enabled = false
    },
    {
        type = "recipe",
        name = "dead-logistic-drone-effective",
        category = "chemistry",
        energy_required = 6,
        ingredients =
        {
          {
            type="fluid", 
            name="samurai-tears", 
            amount=6,
            temperature = 1200,
          },
          {"gamer-juice-fish", 3},
        },
        crafting_machine_tint =
        {
          primary = {r=146/255, g=249/255, b=239/255},
          secondary = {r=242/255, g=129/255, b=1},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="dead-logistic-drone", amount=2, probability = 1},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/dead-l.png",
        icon_size = 64,
        order = "z[dead-robot-l]",
        enabled = false
    },
    {
        type = "recipe",
        name = "dead-construction-drone-ineffective",
        category = "chemistry",
        energy_required = 20,
        ingredients =
        {
          {
            type="fluid", 
            name="samurai-tears", 
            amount=200,
          },
          {"gamer-juice-fish-iron", 3},
        },
        crafting_machine_tint =
        {
          primary = {r=146/255, g=249/255, b=239/255},
          secondary = {r=242/255, g=129/255, b=1},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="dead-construction-drone", amount=1, probability = 1},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/dead-c.png",
        icon_size = 64,
        order = "z[dead-robot-c]",
        enabled = false
        },
        {
            type = "recipe",
            name = "dead-construction-drone-effective",
            category = "chemistry",
            energy_required = 6,
            ingredients =
            {
              {
                type="fluid", 
                name="samurai-tears", 
                amount=6,
                temperature = 1200,
              },
              {"gamer-juice-fish-iron", 3},
            },
            crafting_machine_tint =
            {
              primary = {r=146/255, g=249/255, b=239/255},
              secondary = {r=242/255, g=129/255, b=1},
              tertiary = {r=0, g=0, b=0, a = 0},
              quaternary = {r=0, g=0, b=0, a = 0},
            },
            results=
            {
              {type="item", name="dead-construction-drone", amount=2, probability = 1},
            },
            icon = "__kupil-mujik-shlyapu__/graphics/icons/dead-c.png",
            icon_size = 64,
            order = "z[dead-robot-c]",
            enabled = false
        },
  
})