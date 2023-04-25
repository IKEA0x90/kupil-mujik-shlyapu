data:extend({
  {
    type = "technology",
    name = "earlier-chest",
    icon = "__base__/graphics/technology/logistic-system.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "logistic-chest-requester"
      },
      {
        type = "unlock-recipe",
        recipe = "logistic-chest-active-provider"
      },
      {
        type = "unlock-recipe",
        recipe = "logistic-chest-buffer"
      }
    },
    prerequisites = { "gamer-juice-fish" },
    unit = {
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 20,
      count = 500
    }
  },
  {
    type = "technology",
    name = "sus-accumulators",
    icon = "__kupil-mujik-shlyapu__/graphics/technology/discharge-defense-equipment.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "interesting-battery"
      },
      {
        type = "unlock-recipe",
        recipe = "interesting-battery-charged"
      },
      {
        type = "unlock-recipe",
        recipe = "interesting-battery-discharger"
      },
      {
        type = "unlock-recipe",
        recipe = "interesting-battery-charger"
      }
    },
    prerequisites = { "electric-energy-accumulators" },
    unit = {
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 10,
      count = 500
    }
  },
  {
    type = "technology",
    name = "bioresearch",
    icon = "__base__/graphics/technology/landfill.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
    {
        type = "unlock-recipe",
        recipe = "bioturret"
    },
    {
        type = "unlock-recipe",
        recipe= "living-wall"
    },
    },
    prerequisites = { "military" },
    unit = {
    ingredients = {
      { "automation-science-pack", 1 },
      { "logistic-science-pack", 1 },
      { "military-science-pack", 1 },
      { "chemical-science-pack", 1 },
    },
    time = 15,
    count = 300
    }
  },
  {
    type = "technology",
    name = "radar-mk2",
    icon = "__base__/graphics/technology/optics.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "radar-mk2"
      },
    },
    prerequisites = { "radar" },
    unit = {
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        {"military-science-pack", 1}
      },
      time = 10,
      count = 300
    }
  },
  {
    type = "technology",
    name = "robocharger",
    icon = "__base__/graphics/technology/logistic-robotics.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "robocharger"
      },
    },
    prerequisites = { "robotics", "sus-accumulators"},
    unit = {
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 10,
      count = 500
    }
  },
  {
    type = "technology",
    name = "steel-pipes",
    icon = "__kupil-mujik-shlyapu__/graphics/technology/pipes.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "steel-pipe"
      },
      {
        type = "unlock-recipe",
        recipe = "steel-pipe-to-ground"
      },
      {
        type = "unlock-recipe",
        recipe = "steel-storage-tank"
      },
    },
    prerequisites = { "fluid-handling", "steel-processing"},
    unit = {
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "se-rocket-science-pack", 1 },
      },
      time = 20,
      count = 100
    }
  },
  {
    type = "technology",
    name = "bad-bronze",
    icon = "__kupil-mujik-shlyapu__/graphics/icons/copper-iron.png",
      icon_size = 64, icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "copper-cable-from-con"
      },
      {
        type = "unlock-recipe",
        recipe = "iron-gear-wheel-from-iropper"
      },
      {
        type = "unlock-recipe",
        recipe = "bad-bronze"
      },
      {
        type = "unlock-recipe",
        recipe = "copper-iron"
      },
    },
    prerequisites = { "rp-molten-metal-basic-smelting" },
    unit = {
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "se-rocket-science-pack", 1 },
      },
      time = 10,
      count = 100
    }
  },
  {
    type = "technology",
    name = "dead-energy",
    icon = "__kupil-mujik-shlyapu__/graphics/technology/dead-energy-processing.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "dead-matter-dissolving"
      },
      {
        type = "unlock-recipe",
        recipe = "dead-plate"
      },
      {
        type = "unlock-recipe",
        recipe = "dead-fuel-cell"
      },
      {
        type = "unlock-recipe",
        recipe = "dead-data"
      },
      {
        type = "unlock-recipe",
        recipe = "head-crab"
      },
      {
        type = "unlock-recipe",
        recipe = "dead-reactor"
      },
      {
        type = "unlock-recipe",
        recipe = "glass-pipe"
      },
      {
        type = "unlock-recipe",
        recipe = "kettle"
      },
      {
        type = "unlock-recipe",
        recipe = "china"
      },
    },
    prerequisites = { "rocket-silo", "uranium-processing", "bad-bronze" },
    unit = {
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "se-rocket-science-pack", 1 },
        { "space-science-pack", 1 },
      },
      time = 5,
      count = 100
    }
  },
  {
    type = "technology",
    name = "dead-robots",
    icon = "__base__/graphics/technology/logistic-robotics.png",
    icon_size = 256, icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "spawning-fluid-ineffective"
      },
      {
        type = "unlock-recipe",
        recipe = "spawning-fluid-effective"
      },
      {
        type = "unlock-recipe",
        recipe = "dead-logistic-drone"
      },
      {
        type = "unlock-recipe",
        recipe = "dead-construction-drone"
      },
    },
    prerequisites = { "dead-energy", "robotics" },
    unit = {
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "se-rocket-science-pack", 1 },
        { "space-science-pack", 1 },
      },
      time = 10,
      count = 300
    }
  },
})