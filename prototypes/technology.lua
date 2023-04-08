data:extend({
  {
    type = "technology",
    name = "invisicar",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__kupil-mujik-shlyapu__/graphics/technology/empty.png",
    prerequisites = {"automobilism"},
    unit =
    {
      count_formula = "250",
      ingredients =
      {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 20
    },
    max_level = "1",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe= "invisicar"
      }
    },
    order = "a-a"
  },
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
      recipe = "brr"
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
})