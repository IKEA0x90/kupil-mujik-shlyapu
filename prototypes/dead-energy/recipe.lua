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
    name = "spawning-fluid-effective",
    category = "chemistry",
    energy_required = 6,
    ingredients =
    {
      {
          type="fluid", 
          name="samurai-tears", 
          amount=24,
          temperature = 1200,
      },
    },
    crafting_machine_tint =
    {
      primary = {r=146/255, g=249/255, b=239/255},
      secondary = {r=221/255, g=201/255, b=0/255},
      tertiary = {r=146/255, g=249/255, b=239/255},
      quaternary = {r=221/255, g=201/255, b=0/255},
    },
    results=
    {
      {type="fluid", name="spawning-fluid", amount=3, probability = 1},
    },
    icon = "__kupil-mujik-shlyapu__/graphics/icons/spawning-liquid.png",
    icon_size = 770,
    order = "z[spawning-liquid]",
    enabled = false
  },
  {
    type = "recipe",
    name = "spawning-fluid-ineffective",
    category = "chemistry",
    energy_required = 6,
    ingredients =
    {
      {
          type="fluid", 
          name="samurai-tears", 
          amount=200,
      },
    },
    crafting_machine_tint =
    {
      primary = {r=146/255, g=249/255, b=239/255},
      secondary = {r=221/255, g=201/255, b=0/255},
      tertiary = {r=146/255, g=249/255, b=239/255},
      quaternary = {r=221/255, g=201/255, b=0/255},
    },
    results=
    {
      {type="fluid", name="spawning-fluid", amount=1, probability = 1},
    },
    icon = "__kupil-mujik-shlyapu__/graphics/icons/spawning-liquid.png",
    icon_size = 770,
    order = "z[spawning-liquid]",
    enabled = false
  },
  {
    type = "recipe",
    name = "dead-logistic-drone",
    category = "chemistry",
    energy_required = 20,
    ingredients =
    {
      {
          type="fluid", 
          name="spawning-fluid", 
          amount=2,
      },
      {"gamer-juice-fish", 3},
      {"powerful-sus-battery", 1},
    },
    crafting_machine_tint =
    {
      primary = {r=221/255, g=201/255, b=0/255},
      secondary = {r=242/255, g=129/255, b=1},
      tertiary = {r=221/255, g=201/255, b=0/255},
      quaternary = {r=242/255, g=129/255, b=1},
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
        name = "dead-construction-drone",
        category = "chemistry",
        energy_required = 20,
        ingredients =
        {
            {
              type="fluid", 
              name="spawning-fluid", 
              amount=2,
            },
            {"gamer-juice-fish-iron", 3},
            {"powerful-sus-battery", 1},
        },
        crafting_machine_tint =
        {
            primary = {r=221/255, g=201/255, b=0/255},
            secondary = {r=242/255, g=129/255, b=1},
            tertiary = {r=221/255, g=201/255, b=0/255},
            quaternary = {r=242/255, g=129/255, b=1},
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
        name = "dead-reactor",
        energy_required = 8,
        enabled = false,
        ingredients =
        {
            {"nuclear-reactor", 1},
            {"processing-unit", 20}
        },
        result = "dead-reactor",
        requester_paste_multiplier = 1
    },
    {
        type = "recipe",
        name = "glass-pipe",
        energy_required = 2,
        enabled = false,
        ingredients = {{"steel-plate", 10}, {"copper-plate", 20}, {"glass", 20}, {"se-heat-shielding", 1}},
        result = "glass-pipe",
    },
    {
        type = "recipe",
        name = "kettle",
        category = "crafting-with-fluid",
        enabled = false,
        energy_required = 8,
        ingredients =
          {
            {"steam-turbine", 1},
            {"processing-unit", 20},
            {type = "fluid", name = "samurai-tears", amount = 200}
          },
          results=
          {
            {type="item", name="kettle", amount=1, probability = 1},
          },
    },
    {
        type = "recipe",
        name = "china",
        category = "crafting-with-fluid",
        enabled = false,
        energy_required = 8,
        ingredients =
          {
            {"heat-exchanger", 1},
            {"processing-unit", 20},
            {type = "fluid", name = "samurai-tears", amount = 200}
          },
          results=
          {
            {type="item", name="china", amount=1, probability = 1},
          },
    },
})