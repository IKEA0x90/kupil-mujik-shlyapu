local sounds = require("__base__/prototypes/entity/sounds")

function generate_mutlilevel(levels, name, mod)
    local table_of_tables = {}
    for i=2, levels do
        local inner_table = {
            type = "technology",
            name= "fish-mutation-"..name.."-"..i,
            icon = "__base__/graphics/technology/exoskeleton-equipment.png",
            icon_size = 256, icon_mipmaps = 4,
            effects =
            {
              {
                type = name,
                modifier = mod
              }
            },
            prerequisites = { "fish-mutation-"..name.."-"..(i-1) },
            unit =
            {
              count_formula = (20000*math.log(i/100 + 1)/math.log(500)) - 30,
              ingredients =
              {
                {"neural-gel-fish", 1},
              },
              time = 30
            },
            upgrade = false,
            order = "z"
        }
        table.insert(table_of_tables, inner_table)
    end
    return table_of_tables
end

function generate_mutlilevel_special(levels)
    local table_of_tables = {}
    for i=2, levels do
        local inner_table = {
            type = "technology",
            name= "fish-mutation-distance-"..i,
            prerequisites = {"fish-mutation-distance-"..(i-1)},
            icon = "__base__/graphics/technology/exoskeleton-equipment.png",
            icon_size = 256, icon_mipmaps = 4,
            effects =
            {
              {
                type = "character-build-distance",
                modifier = 1
              },
              {
                type = "character-build-distance",
                modifier = 1
              },
              {
                type = "character-reach-distance",
                modifier = 1
              },
              {
                type = "character-resource-reach-distance",
                modifier = 1
              },
              {
                type = "character-item-pickup-distance",
                modifier = 1
              },
            },
            unit =
            {
              count_formula = (20000*math.log(i/100 + 1)/math.log(500)) - 30,
              ingredients =
              {
                {"neural-gel-fish", i},
              },
              time = 30
            },
            upgrade = false,
            order = "z"
          }
        table.insert(table_of_tables, inner_table)
    end
    return table_of_tables
end

--data:extend(generate_mutlilevel_special(1000))
--data:extend(generate_mutlilevel(500, "character-health-bonus", 1))
--data:extend(generate_mutlilevel(300, "character-inventory-slots-bonus", 1))
--data:extend(generate_mutlilevel(200, "character-running-speed", 0.01))
--data:extend(generate_mutlilevel(300, "character-mining-speed", 0.01))
--data:extend(generate_mutlilevel(500, "character-crafting-speed", 0.01))

local nerestilishe = table.deepcopy((data.raw["assembling-machine"]["chemical-plant"]))
nerestilishe.name = "nerestilishe"
nerestilishe.minable = {mining_time = 1, result = "nerestilishe"}
nerestilishe.crafting_categories = {"fish-farming"}
nerestilishe.crafting_speed = 1
nerestilishe.energy_source =
{
  type = "electric",
  usage_priority = "secondary-input",
  emissions_per_minute = 0.5,
  drain = "10kW"
}
nerestilishe.energy_usage = "40kW"
nerestilishe.icons = {
  {
    icon = "__base__/graphics/icons/chemical-plant.png",
  },
  {
    icon = "__base__/graphics/icons/fish.png",
  }
}

local molten_iron_fish = table.deepcopy((data.raw["wall"]["stone-wall"]))
molten_iron_fish.max_health = 400
molten_iron_fish.attack_reaction = {
    {
    range = 2,
    damage_type = "physical",
    reaction_modifier = 0.25,
        action =
        {
            type = "direct",
            action_delivery =
            {
                type = "instant",
                target_effects =
                {
                    type = "damage",
                    damage = {amount = 0.1, type = "physical"}
                }
            }
        },
    }
}
molten_iron_fish.icon = "__kupil-mujik-shlyapu__/graphics/icons/molten-iron.png"
molten_iron_fish.minable = {mining_time = 0.2, result = "molten-iron-fish"}
molten_iron_fish.name = "molten-iron-fish"

local molten_copper_fish = table.deepcopy((data.raw["electric-pole"]["medium-electric-pole"]))
molten_copper_fish.icon = "__kupil-mujik-shlyapu__/graphics/icons/molten-copper.png"
molten_copper_fish.minable = {mining_time = 0.1, result = "molten-copper-fish"}
molten_copper_fish.maximum_wire_distance = 10
molten_copper_fish.supply_area_distance = 3
molten_copper_fish.name = "molten-copper-fish"
molten_copper_fish.flags = {"placeable-neutral", "player-creation", "placeable-off-grid"}

local fish_lab = table.deepcopy((data.raw["lab"]["lab"]))
fish_lab.name = "fish-lab"
fish_lab.minable = {mining_time = 0.2, result = "fish-lab"}
fish_lab.inputs = {"fish-science", "neural-gel-fish", "chemical-science-pack"}
fish_lab.icons = {
  {
    icon = "__base__/graphics/icons/lab.png"
  },
  {
    icon = "__base__/graphics/icons/fish.png",
  }
}

local gamer = table.deepcopy(data.raw["logistic-robot"]["logistic-robot"])
gamer.name = "gamer-juice-fish"
gamer.minable = { mining_time = 0.05, result = "gamer-juice-fish" }
gamer.speed = 0.15
gamer.max_energy = "3MJ"
gamer.idle.tint = {r=1, g=0, b=1, a=1}
gamer.idle.hr_version.tint = {r=1, g=0, b=1, a=1}
gamer.idle_with_cargo.tint = {r=1, g=0, b=1, a=1}
gamer.idle_with_cargo.hr_version.tint = {r=1, g=0, b=1, a=1}
gamer.in_motion.tint = {r=1, g=0, b=1, a=1}
gamer.in_motion.hr_version.tint = {r=1, g=0, b=1, a=1}
gamer.in_motion_with_cargo.tint = {r=1, g=0, b=1, a=1}
gamer.in_motion_with_cargo.hr_version.tint = {r=1, g=0, b=1, a=1}

local gamer2 = table.deepcopy(data.raw["construction-robot"]["construction-robot"])
gamer2.name = "gamer-juice-fish-iron"
gamer2.minable = { mining_time = 0.05, result = "gamer-juice-fish-iron" }
gamer2.speed = 0.15
gamer2.max_energy = "3MJ"
gamer2.idle.tint = {r=1, g=0, b=1, a=1}
gamer2.idle.hr_version.tint = {r=1, g=0, b=1, a=1}
gamer2.in_motion.tint = {r=1, g=0, b=1, a=1}
gamer2.in_motion.hr_version.tint = {r=1, g=0, b=1, a=1}

data:extend({
  gamer,
  gamer2,
    {
      type = "recipe",
      name = "grilled-fish",
      category = "smelting",
      subgroup = "use-on-self",
      normal =
      {
        enabled = false,
        energy_required = 4,
        ingredients = {{"raw-fish", 1}},
        result = "grilled-fish"
      }
    },
    {
        type = "recipe",
        name = "nerestilishe",
        energy_required = 5,
        enabled = false,
        ingredients =
        {
          {"steel-plate", 5},
          {"iron-gear-wheel", 5},
          {"electronic-circuit", 5},
          {"pipe", 5}
        },
        result= "nerestilishe"
    },
    {
        type = "recipe",
        name = "fish-science",
        category = "fish-farming",
        subgroup = "science-pack",
        energy_required = 10,
        ingredients =
        {
          {"raw-fish", 1},
          {"automation-science-pack", 1},
        },
        crafting_machine_tint =
        {
          
          primary = {r=1, g=0, b=0, a = 1.000}, 
          secondary = {r=238/255, g=60/255, b=61/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="fish-science", amount=1},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/fish-science.png",
        icon_size = 64,
        order = "z[neural-gel-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "fish-lab",
        energy_required = 2,
        ingredients =
        {
          {"electronic-circuit", 10},
          {"iron-gear-wheel", 10},
          {"transport-belt", 4}
        },
        result = "fish-lab"
    },
    {
        type = "recipe",
        name = "normal-fish",
        category = "fish-farming",
        subgroup = "use-on-self",
        energy_required = 40,
        ingredients =
        {
          {
          type="fluid", 
          name="water", 
          amount=1000
          },
          {"raw-fish", 2}
        },
        crafting_machine_tint =
        {
          primary = {r=48/255, g=155/255, b=180/255, a = 1.000}, 
          secondary = {r=166/255, g=245/255, b=1, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {"raw-fish", 3}
        },
        icon = "__base__/graphics/icons/fish.png",
        icon_size = 64,
        order = "z[raw-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "heavy-oil-fish-mutation",
        category = "fish-farming",
        subgroup = "thrown",
        energy_required = 120,
        ingredients =
        {
          {
          type="fluid", 
          name="heavy-oil", 
          amount=400
          },
          {"raw-fish", 2}
        },
        crafting_machine_tint =
        {
          primary = {r=93/255, g=29/255, b=0, a = 1.000}, 
          secondary = {r=1, g=167/255, b=104/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="heavy-oil-fish", amount=1, probability = 0.4},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/heavy-oil.png",
        icon_size = 64,
        order = "z[heavy-oil-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "heavy-oil-fish",
        category = "fish-farming",
        subgroup = "tool",
        energy_required = 7,
        ingredients =
        {
          {
          type="fluid", 
          name="heavy-oil", 
          amount=20
          },
          {"heavy-oil-fish", 2}
        },
        crafting_machine_tint =
        {
          
          primary = {r=93/255, g=29/255, b=0, a = 1.000}, 
          secondary = {r=1, g=167/255, b=104/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="heavy-oil-fish", amount=3},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/heavy-oil.png",
        icon_size = 64,
        order = "z[heavy-oil-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "gamer-juice-fish-copper-mutation",
        category = "fish-farming",
        energy_required = 300,
        ingredients =
        {
          {
            type="fluid", 
            name="gamer-juice", 
            amount=60
          },
          {
            type="fluid", 
            name="molten-copper", 
            amount=60
          },
          {"raw-fish", 2}
        },
        crafting_machine_tint =
        {
          primary = {r=242/255, g=129/255, b=1},
          secondary = {r=242/255, g=129/255, b=1},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="gamer-juice-fish", amount=1, probability = 0.1},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/gamer-juice-copper.png",
        icon_size = 64,
        order = "z[gamer-juice-fish-copper]",
        enabled = false
    },
    {
        type = "recipe",
        name = "gamer-juice-fish-copper",
        category = "fish-farming",
        energy_required = 15,
        ingredients =
        {
          {
          type="fluid", 
          name="gamer-juice", 
          amount=120
          },
          {
            type="fluid", 
            name="molten-copper", 
            amount = 60
          },
          {"gamer-juice-fish", 1},
          {"logistic-robot", 5}
        },
        crafting_machine_tint =
        {
          primary = {r=242/255, g=129/255, b=1},
          secondary = {r=242/255, g=129/255, b=1},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="gamer-juice-fish", amount=2, probability = 1},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/gamer-juice-copper.png",
        icon_size = 64,
        order = "z[gamer-juice-fish-copper]",
        enabled = false
    },
    {
      type = "recipe",
      name = "gamer-juice-fish-iron-mutation",
      category = "fish-farming",
      energy_required = 300,
      ingredients =
      {
        {
          type="fluid", 
          name="gamer-juice", 
          amount=60
        },
        {
          type="fluid", 
          name="molten-iron", 
          amount=60
        },
        {"raw-fish", 2}
      },
      crafting_machine_tint =
      {
        primary = {r=242/255, g=129/255, b=1},
        secondary = {r=242/255, g=129/255, b=1},
        tertiary = {r=0, g=0, b=0, a = 0},
        quaternary = {r=0, g=0, b=0, a = 0},
      },
      results=
      {
        {type="item", name="gamer-juice-fish-iron", amount=1, probability = 0.1},
      },
      icon = "__kupil-mujik-shlyapu__/graphics/icons/gamer-juice-iron.png",
      icon_size = 64,
      order = "z[gamer-juice-fish-iron]",
      enabled = false
  },
  {
      type = "recipe",
      name = "gamer-juice-fish-iron",
      category = "fish-farming",
      energy_required = 15,
      ingredients =
      {
        {
        type="fluid", 
        name="gamer-juice", 
        amount=120
        },
        {
          type="fluid", 
          name="molten-iron", 
          amount=60
        },
        {"gamer-juice-fish-iron", 1},
        {"construction-robot", 5}
      },
      crafting_machine_tint =
      {
        primary = {r=242/255, g=129/255, b=1},
        secondary = {r=242/255, g=129/255, b=1},
        tertiary = {r=0, g=0, b=0, a = 0},
        quaternary = {r=0, g=0, b=0, a = 0},
      },
      results=
      {
        {type="item", name="gamer-juice-fish-iron", amount=2, probability = 1},
      },
      icon = "__kupil-mujik-shlyapu__/graphics/icons/gamer-juice-iron.png",
      icon_size = 64,
      order = "z[gamer-juice-fish-iron]",
      enabled = false
    },
    {
        type = "recipe",
        name = "light-oil-fish-mutation",
        category = "fish-farming",
        subgroup = "equipment",
        energy_required = 120,
        ingredients =
        {
          {
          type="fluid", 
          name="light-oil", 
          amount=100
          },
          {"raw-fish", 2}
        },
        crafting_machine_tint =
        {
          
          primary = {r=95/255, g=64/255, b=5/255, a = 1.000}, 
          secondary = {r=253/255, g=225/255, b=130/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="light-oil-fish", amount=1, probability = 0.1},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/light-oil.png",
        icon_size = 64,
        order = "z[light-oil-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "light-oil-fish",
        category = "fish-farming",
        subgroup = "equipment",
        energy_required = 60,
        ingredients =
        {
          {
          type="fluid", 
          name="light-oil", 
          amount=200
          },
          {"light-oil-fish", 2}
        },
        crafting_machine_tint =
        {
          
          primary = {r=95/255, g=64/255, b=5/255, a = 1.000}, 
          secondary = {r=253/255, g=225/255, b=130/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="light-oil-fish", amount=3},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/light-oil.png",
        icon_size = 64,
        order = "z[light-oil-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "sulfuric-acid-fish-mutation",
        category = "fish-farming",
        subgroup = "thrown",
        energy_required = 120,
        ingredients =
        {
          {
          type="fluid", 
          name="sulfuric-acid", 
          amount=100
          },
          {"raw-fish", 2}
        },
        crafting_machine_tint =
        {
          
          primary = {r = 1.000, g = 0.958, b = 0.000, a = 1.000},
          secondary = {r = 1.000, g = 0.852, b = 0.172, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="sulfuric-acid-fish", amount=1, probability = 0.2},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/sulfuric-acid.png",
        icon_size = 64,
        order = "z[sulfuric-acid-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "sulfuric-acid-fish",
        category = "fish-farming",
        subgroup = "thrown",
        energy_required = 10,
        ingredients =
        {
          {
          type="fluid", 
          name="sulfuric-acid", 
          amount=10
          },
          {"sulfuric-acid-fish", 2}
        },
        crafting_machine_tint =
        {
          
          primary = {r = 1.000, g = 0.958, b = 0.000, a = 1.000},
          secondary = {r = 1.000, g = 0.852, b = 0.172, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="sulfuric-acid-fish", amount=3},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/sulfuric-acid.png",
        icon_size = 64,
        order = "z[sulfuric-acid-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "molten-iron-fish-mutation",
        category = "fish-farming",
        subgroup = "defensive-structure",
        energy_required = 120,
        ingredients =
        {
          {
          type="fluid", 
          name="molten-iron", 
          amount=100
          },
          {"raw-fish", 2}
        },
        crafting_machine_tint =
        {
          
          primary = {r=64/255, g=64/255, b=64/255, a = 1.000}, 
          secondary = {r=240/255, g=240/255, b=240/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="molten-iron-fish", amount=1, probability = 0.1},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/molten-iron.png",
        icon_size = 64,
        order = "z[molten-iron-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "molten-iron-fish",
        category = "fish-farming",
        subgroup = "defensive-structure",
        energy_required = 2,
        ingredients =
        {
          {
          type="fluid", 
          name="molten-iron", 
          amount=2
          },
          {"molten-iron-fish", 2}
        },
        crafting_machine_tint =
        {
          
          primary = {r=64/255, g=64/255, b=64/255, a = 1.000}, 
          secondary = {r=240/255, g=240/255, b=240/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="molten-iron-fish", amount=3},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/molten-iron.png",
        icon_size = 64,
        order = "z[molten-iron-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "molten-copper-fish-mutation",
        category = "fish-farming",
        subgroup = "energy-pipe-distribution",
        energy_required = 120,
        ingredients =
        {
          {
          type="fluid", 
          name="molten-copper", 
          amount=100
          },
          {"raw-fish", 2}
        },
        crafting_machine_tint =
        {
          
          primary = {r=155/255, g=90/255, b=65/255, a = 1.000}, 
          secondary = {r=1, g=163/255, b=115/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="molten-copper-fish", amount=1, probability = 1},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/molten-copper.png",
        icon_size = 64,
        order = "z[molten-copper-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "molten-copper-fish",
        category = "fish-farming",
        subgroup = "energy-pipe-distribution",
        energy_required = 10,
        ingredients =
        {
          {
          type="fluid", 
          name="molten-copper", 
          amount=5
          },
          {"molten-copper-fish", 2}
        },
        crafting_machine_tint =
        {
          
          primary = {r=155/255, g=90/255, b=65/255, a = 1.000}, 
          secondary = {r=1, g=163/255, b=115/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="molten-copper-fish", amount=3},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/molten-copper.png",
        icon_size = 64,
        order = "z[molten-copper-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "lubricant-fish-mutation",
        category = "fish-farming",
        subgroup = "module-speed",
        energy_required = 120,
        ingredients =
        {
          {
          type="fluid", 
          name="lubricant", 
          amount=20
          },
          {"raw-fish", 1},
          {"light-oil-fish", 1}
        },
        crafting_machine_tint =
        {
          
          primary = {r=8/255, g=67/255, b=2/255, a = 1.000}, 
          secondary = {r=155/255, g=246/255, b=126/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="lubricant-fish", amount=1, probability = 0.1},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/lubricant.png",
        icon_size = 64,
        order = "z[lubricant-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "lubricant-fish",
        category = "fish-farming",
        subgroup = "module-speed",
        energy_required = 120,
        ingredients =
        {
          {
          type="fluid", 
          name="lubricant", 
          amount=100
          },
          {"lubricant-fish", 2},
        },
        crafting_machine_tint =
        {
          
          primary = {r=8/255, g=67/255, b=2/255, a = 1.000}, 
          secondary = {r=155/255, g=246/255, b=126/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="lubricant-fish", amount=3},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/lubricant.png",
        icon_size = 64,
        order = "z[lubricant-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "lubricant-fish-equipment",
        category = "fish-farming",
        subgroup = "equipment",
        energy_required = 0.01,
        ingredients =
        {
          {"lubricant-fish", 1},
        },
        crafting_machine_tint =
        {
          
          primary = {r=8/255, g=67/255, b=2/255, a = 1.000}, 
          secondary = {r=155/255, g=246/255, b=126/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="lubricant-fish-equipment", amount=1},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/lubricant.png",
        icon_size = 64,
        order = "z[lubricant-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "liquid-rocket-fuel-fish-mutation",
        category = "fish-farming",
        subgroup = "thrown",
        energy_required = 120,
        ingredients =
        {
          {
          type="fluid", 
          name="se-liquid-rocket-fuel", 
          amount=250
          },
          {"raw-fish", 1},
          {"heavy-oil-fish", 1}
        },
        crafting_machine_tint =
        {
          
          primary = {r=229/255, g=72/255, b=19/255, a = 1.000}, 
          secondary = {r=1, g=224/255, b=73/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="liquid-rocket-fuel-fish", amount=1, probability = 0.3},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/liquid-rocket-fuel.png",
        icon_size = 64,
        order = "z[liquid-rocket-fuel-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "liquid-rocket-fuel-fish",
        category = "fish-farming",
        subgroup = "thrown",
        energy_required = 20,
        ingredients =
        {
          {
          type="fluid", 
          name="se-liquid-rocket-fuel", 
          amount=100
          },
          {"liquid-rocket-fuel-fish", 2},
        },
        crafting_machine_tint =
        {
          
          primary = {r=229/255, g=72/255, b=19/255, a = 1.000}, 
          secondary = {r=1, g=224/255, b=73/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="liquid-rocket-fuel-fish", amount=3},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/liquid-rocket-fuel.png",
        icon_size = 64,
        order = "z[liquid-rocket-fuel-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "space-water-fish-mutation",
        category = "fish-farming",
        subgroup = "use-on-self",
        energy_required = 600,
        ingredients =
        {
          {
          type="fluid", 
          name="se-space-water", 
          amount=1000
          },
          {"raw-fish", 1}
        },
        crafting_machine_tint =
        {
          
          primary = {r=48/255, g=155/255, b=180/255, a = 1.000}, 
          secondary = {r=118/255, g=120/255, b=120/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="space-water-fish", amount=1, probability = 1},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/space-water.png",
        icon_size = 64,
        order = "z[space-water]",
        enabled = false
    },
    {
        type = "recipe",
        name = "space-water-fish",
        category = "fish-farming",
        subgroup = "use-on-self",
        energy_required = 150,
        ingredients =
        {
          {
          type="fluid", 
          name="se-space-water", 
          amount=1000
          },
          {"space-water-fish", 2}
        },
        crafting_machine_tint =
        {
          
          primary = {r=48/255, g=155/255, b=180/255, a = 1.000}, 
          secondary = {r=118/255, g=120/255, b=120/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="space-water-fish", amount=1, probability = 1},
          {type="item", name="raw-fish", amount=1, probability = 0.2},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/space-water.png",
        icon_size = 64,
        order = "z[space-water]",
        enabled = false
    },
    {
        type = "recipe",
        name = "vitalic-acid-fish-mutation",
        category = "fish-farming",
        subgroup = "thrown",
        energy_required = 120,
        ingredients =
        {
          {
          type="fluid", 
          name="se-vitalic-acid", 
          amount=5
          },
          {"raw-fish", 1},
          {"sulfuric-acid-fish", 1}
        },
        crafting_machine_tint =
        {
          
          primary = {r=97/255, g=255/255, b=0, a = 1.000}, 
          secondary = {r=232/255, g=253/255, b=87/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="vitalic-acid-fish", amount=1, probability = 0.1},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/vitalic-acid.png",
        icon_size = 64,
        order = "z[vitalic-acid-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "vitalic-acid-fish",
        category = "fish-farming",
        subgroup = "thrown",
        energy_required = 60,
        ingredients =
        {
          {
          type="fluid", 
          name="se-vitalic-acid", 
          amount=5
          },
          {"vitalic-acid-fish", 2},
        },
        crafting_machine_tint =
        {
          
          primary = {r=97/255, g=255/255, b=0, a = 1.000}, 
          secondary = {r=232/255, g=253/255, b=87/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="vitalic-acid-fish", amount=3},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/vitalic-acid.png",
        icon_size = 64,
        order = "z[vitalic-acid-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "nutrient-gel-fish-mutation",
        category = "fish-farming",
        subgroup = "use-on-self",
        energy_required = 120,
        ingredients =
        {
          {
          type="fluid", 
          name="se-nutrient-gel", 
          amount=100
          },
          {"raw-fish", 1},
          {"space-water-fish", 1}
        },
        crafting_machine_tint =
        {
          
          primary = {r=192/255, g=0, b=50/255, a = 1.000}, 
          secondary = {r=251/255, g=117/255, b=224/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="nutrient-gel-fish", amount=1, probability = 0.1},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/nutrient-gel.png",
        icon_size = 64,
        order = "z[nutrient-gel-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "nutrient-gel-fish",
        category = "fish-farming",
        subgroup = "use-on-self",
        energy_required = 60,
        ingredients =
        {
          {
          type="fluid", 
          name="se-nutrient-gel", 
          amount=100
          },
          {"nutrient-gel-fish", 2},
        },
        crafting_machine_tint =
        {
          
          primary = {r=192/255, g=0, b=50/255, a = 1.000}, 
          secondary = {r=251/255, g=117/255, b=224/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="nutrient-gel-fish", amount=3},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/nutrient-gel.png",
        icon_size = 64,
        order = "z[nutrient-gel-fish]",
        enabled = false
    },
    {
        type = "recipe",
        name = "neural-gel-fish-mutation",
        category = "fish-farming",
        subgroup = "science-pack",
        energy_required = 120,
        ingredients =
        {
          {
          type="fluid", 
          name="se-neural-gel", 
          amount=10
          },
          {"nutrient-gel-fish", 1},
          {"space-water-fish", 1},
          {"light-oil-fish", 1}
        },
        crafting_machine_tint =
        {
          
          primary = {r=103/255, g=27/255, b=201/255, a = 1.000}, 
          secondary = {r=205/255, g=93/255, b=251/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="neural-gel-fish", amount=1, probability = 0.1},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/neural-gel.png",
        icon_size = 64,
        order = "z[neural-gel-fish]",
        enabled = false
    },  
    {
        type = "recipe",
        name = "neural-gel-fish",
        category = "fish-farming",
        subgroup = "science-pack",
        energy_required = 60,
        ingredients =
        {
          {
          type="fluid", 
          name="se-neural-gel", 
          amount=10
          },
          {"neural-gel-fish", 3},
        },
        crafting_machine_tint =
        {
          
          primary = {r=103/255, g=27/255, b=201/255, a = 1.000}, 
          secondary = {r=205/255, g=93/255, b=251/255, a = 1.000},
          tertiary = {r=0, g=0, b=0, a = 0},
          quaternary = {r=0, g=0, b=0, a = 0},
        },
        results=
        {
          {type="item", name="neural-gel-fish", amount=4},
        },
        icon = "__kupil-mujik-shlyapu__/graphics/icons/neural-gel.png",
        icon_size = 64,
        order = "z[neural-gel-fish]",
        enabled = false
    },
    --[[
    {
      type = "recipe",
      name = "samurai-tears-fish-mutation",
      category = "fish-farming",
      subgroup = "equipment",
      energy_required = 120,
      ingredients =
      {
        {
        type="fluid", 
        name="samurai-tears", 
        amount=100
        },
        {"raw-fish", 2}
      },
      crafting_machine_tint =
      {
        base_color = {r=146/255, g=249/255, b=239/255},
        secondary = {r=190/255, g=205/255, b=122/255},
        tertiary = {r=0, g=0, b=0, a = 0},
        quaternary = {r=0, g=0, b=0, a = 0},
      },
      results=
      {
        {type="item", name="samurai-tears-fish", amount=1, probability = 0.1},
      },
      icon = "__kupil-mujik-shlyapu__/graphics/icons/samurai-tears.png",
      icon_size = 64,
      order = "z[samurai-tears-fish]",
      enabled = false
  },
  {
      type = "recipe",
      name = "samurai-tears-fish",
      category = "fish-farming",
      subgroup = "equipment",
      energy_required = 60,
      ingredients =
      {
        {
        type="fluid", 
        name="samurai-tears", 
        amount=200
        },
        {"samurai-tears-fish", 2}
      },
      crafting_machine_tint =
      {
        
        base_color = {r=146/255, g=249/255, b=239/255},
        secondary = {r=190/255, g=205/255, b=122/255},
        tertiary = {r=0, g=0, b=0, a = 0},
        quaternary = {r=0, g=0, b=0, a = 0},
      },
      results=
      {
        {type="item", name="samurai-tears-fish", amount=3},
      },
      icon = "__kupil-mujik-shlyapu__/graphics/icons/samurai-tears.png",
      icon_size = 64,
      order = "z[samurai-tears-fish]",
      enabled = false
  },
  --]]

})

data:extend({

    nerestilishe,
    molten_iron_fish,
    molten_copper_fish,
    fish_lab,
    {
        type = "recipe-category",
        name = "fish-farming",
        localised_name = "Nerestit rib",
        localised_description = "Kladyosh dve ribi poluchaesh tri"
    },
    {
        type = "item",
        name = "nerestilishe",
        icons = {
          {
            icon = "__base__/graphics/icons/chemical-plant.png",
          },
          {
            icon = "__base__/graphics/icons/fish.png",
          }
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "production-machine",
        order = "z[nerestilishe]",
        stack_size = 10,
        place_result = "nerestilishe"
    },
    {
        type = "tool",
        name = "fish-science",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/fish-science.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "science-pack",
        order = "z[fish-science]",
        stack_size = 200,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value"
    },
    {
        type = "item",
        name = "fish-lab",
        icons = {
          {
            icon = "__base__/graphics/icons/lab.png"
          },
          {
            icon = "__base__/graphics/icons/fish.png",
          }
        },
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "lab",
        order = "z[fish-lab]",
        place_result = "fish-lab",
        stack_size = 10
    },
    {
        type = "item",
        name = "gamer-juice-fish",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/gamer-juice-copper.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "logistic-network",
        order = "z[gamer-juice-fish-copper]",
        place_result = "gamer-juice-fish",
        stack_size = 50
    },
    {
      type = "item",
      name = "gamer-juice-fish-iron",
      icon = "__kupil-mujik-shlyapu__/graphics/icons/gamer-juice-iron.png",
      icon_size = 64, icon_mipmaps = 4,
      subgroup = "logistic-network",
      order = "z[gamer-juice-fish-iron]",
      place_result = "gamer-juice-fish-iron",
      stack_size = 50
    },
    {
        type = "capsule",
        name = "grilled-fish",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/grilled.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "use-on-self",
        capsule_action =
        {
          type = "use-on-self",
          attack_parameters =
          {
            type = "projectile",
            activation_type = "consume",
            ammo_category = "capsule",
            cooldown = 30,
            range = 0,
            ammo_type =
            {
              category = "capsule",
              target_type = "position",
              action =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  target_effects =
                  {
                    {
                      type = "damage",
                      damage = {type = "physical", amount = -60}
                    },
                    {
                      type = "play-sound",
                      sound = sounds.eat_fish
                    }
                  }
                }
              }
            }
          }
        },
        order = "z[grilled-fish]",
        stack_size = 100
    },
    {
        type = "repair-tool",
        name = "heavy-oil-fish",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/heavy-oil.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "tool",
        order = "z[heavy-oil-fish]",
        speed = 8,
        durability = 1000,
        stack_size = 300
    },
    {
        type = "item",
        name = "light-oil-fish",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/light-oil.png",
        icon_size = 64, icon_mipmaps = 4,
        placed_as_equipment_result = "light-oil-fish",
        subgroup = "equipment",
        order = "z[light-oil-fish]",
        default_request_amount = 5,
        stack_size = 20
    },
    {
      type = "item",
      name = "lubricant-fish-equipment",
      icon = "__kupil-mujik-shlyapu__/graphics/icons/lubricant.png",
      icon_size = 64, icon_mipmaps = 4,
      placed_as_equipment_result = "lubricant-fish-equipment",
      subgroup = "equipment",
      order = "z[lubricant-fish]",
      default_request_amount = 5,
      stack_size = 20
  },
    --[[
    {
      type = "item",
      name = "samurai-tears-fish",
      icon = "__kupil-mujik-shlyapu__/graphics/icons/samurai-tears.png",
      icon_size = 64, icon_mipmaps = 4,
      placed_as_equipment_result = "samurai-tears-fish",
      subgroup = "equipment",
      order = "z[samurai-tears-fish]",
      default_request_amount = 5,
      stack_size = 20
    },
    --]]
    {
      type = "movement-bonus-equipment",
      name = "lubricant-fish-equipment",
      sprite =
      {
        filename = "__kupil-mujik-shlyapu__/graphics/icons/lubricant-equipment.png",
        width = 64,
        height = 64,
        priority = "medium",
      },
      shape =
      {
        width = 1,
        height = 1,
        type = "full"
      },
      energy_source =
      {
        type = "electric",
        usage_priority = "secondary-input"
      },
      energy_consumption = "60kW",
      movement_bonus = 0,
      categories = {"armor"}
    },
    {
        type = "movement-bonus-equipment",
        name = "light-oil-fish",
        sprite =
        {
          filename = "__kupil-mujik-shlyapu__/graphics/icons/light-oil-equipment.png",
          width = 64,
          height = 64,
          priority = "medium",
        },
        shape =
        {
          width = 1,
          height = 1,
          type = "full"
        },
        energy_source =
        {
          type = "electric",
          usage_priority = "secondary-input"
        },
        energy_consumption = "10kW",
        movement_bonus = 0.05,
        categories = {"armor"}
    },
    {
        type = "capsule",
        name = "sulfuric-acid-fish",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/sulfuric-acid.png",
        icon_size = 64, icon_mipmaps = 4,
        capsule_action =
        {
          type = "throw",
          attack_parameters =
          {
            type = "projectile",
            activation_type = "throw",
            ammo_category = "capsule",
            cooldown = 30,
            projectile_creation_distance = 0.6,
            range = 25,
            ammo_type =
            {
              category = "capsule",
              target_type = "position",
              action =
              {
                {
                  type = "direct",
                  action_delivery =
                  {
                    type = "projectile",
                    projectile = "poison-capsule",
                    starting_speed = 0.3
                  }
                },
                {
                  type = "direct",
                  action_delivery =
                  {
                    type = "instant",
                    target_effects =
                    {
                      {
                        type = "play-sound",
                        sound = sounds.throw_projectile
                      }
                    }
                  }
                }
              }
            }
          }
        },
        subgroup = "capsule",
        order = "thrown",
        stack_size = 100
    },
    {
        type = "item",
        name = "molten-iron-fish",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/molten-iron.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "defensive-structure",
        order = "z[molten-iron-fish]",
        place_result = "molten-iron-fish",
        stack_size = 100
    },
    {
        type = "item",
        name = "molten-copper-fish",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/molten-copper.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "energy-pipe-distribution",
        order = "z[molten-copper-fish]",
        place_result = "molten-copper-fish",
        stack_size = 50
    },
    {
        type = "module",
        name = "lubricant-fish",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/lubricant.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "module-speed",
        category = "speed",
        tier = 1,
        order = "z[lubricant-fish]",
        stack_size = 50,
        effect = { speed = {bonus = 0.3}, consumption = {bonus = 2}},
        beacon_tint =
        {
          primary = {r = 0, g = 1, b = 0, a = 1.000}, -- #70b6ffff
          secondary = {r = 00, g = 1, b = 0, a = 1.000}, -- #63f8ffff
        },
        art_style = "vanilla",
        requires_beacon_alt_mode = false
    },
    {
        type = "capsule",
        name = "space-water-fish",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/space-water.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "use-on-self",
        capsule_action =
        {
          type = "use-on-self",
          attack_parameters =
          {
            type = "projectile",
            activation_type = "consume",
            ammo_category = "capsule",
            cooldown = 30,
            range = 0,
            ammo_type =
            {
              category = "capsule",
              target_type = "position",
              action =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  target_effects =
                  {
                    {
                      type = "damage",
                      damage = {type = "physical", amount = 1000}
                    },
                    {
                      type = "play-sound",
                      sound = sounds.eat_fish
                    }
                  }
                }
              }
            }
          }
        },
        order = "z[space-water-fish]",
        stack_size = 5
    },
    {
        type = "capsule",
        name = "nutrient-gel-fish",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/nutrient-gel.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "use-on-self",
        capsule_action =
        {
          type = "use-on-self",
          attack_parameters =
          {
            type = "projectile",
            activation_type = "consume",
            ammo_category = "capsule",
            cooldown = 30,
            range = 0,
            ammo_type =
            {
              category = "capsule",
              target_type = "position",
              action =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  target_effects =
                  {
                    {
                      type = "damage",
                      damage = {type = "physical", amount = -1000}
                    },
                    {
                      type = "play-sound",
                      sound = sounds.eat_fish
                    }
                  }
                }
              }
            }
          }
        },
        order = "z[nutrient-gel-fish]",
        stack_size = 5
    },
    {
        type = "tool",
        name = "neural-gel-fish",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/neural-gel.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "science-pack",
        order = "z[neural-gel-fish]",
        stack_size = 200,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value"
    },
    {
        type = "capsule",
        name = "liquid-rocket-fuel-fish",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/liquid-rocket-fuel.png",
        icon_size = 64, icon_mipmaps = 4,
        capsule_action =
        {
            type = "throw",
            attack_parameters =
            {
                type = "projectile",
                ammo_category = "grenade",
                cooldown = 30,
                projectile_creation_distance = 0.6,
                range = 20,
                ammo_type =
                {
                    category = "grenade",
                    target_type = "position",
                    action =
                    {
                        type = "direct",
                        action_delivery =
                        {
                            type = "projectile",
                            projectile = "molotov-cocktail",
                            starting_speed = 0.05
                        }
                    }
                }
            }
        },
        subgroup = "thrown",
        order = "z[liquid-rocket-fuel-fish]",
        stack_size = 100
    },
    {
        type = "capsule",
        name = "vitalic-acid-fish",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/vitalic-acid.png",
        icon_size = 64, icon_mipmaps = 4,
        capsule_action =
        {
          type = "throw",
          attack_parameters =
          {
            type = "projectile",
            ammo_category = "capsule",
            cooldown = 15,
            projectile_creation_distance = 0.6,
            range = 25,
            ammo_type =
            {
              category = "capsule",
              target_type = "position",
              action =
              {
                {
                  type = "direct",
                  action_delivery =
                  {
                    type = "projectile",
                    projectile = "treenade",
                    starting_speed = 0.3
                  }
                }
              }
            }
          }
        },
        subgroup = "thrown",
        order = "z[vitalic-acid]",
        stack_size = 100
    }
})

data:extend({

    {
        type = "technology",
        name = "fish-farming",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/fluid-handling.png",
        prerequisites = {"fluid-handling"},
        unit =
        {
          count_formula = "100",
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
          },
          time = 20
        },
        max_level = "1",
        effects =
        {
          {
            type = "unlock-recipe",
            recipe= "grilled-fish"
          },
          {
            type = "unlock-recipe",
            recipe= "nerestilishe"
          },
          {
            type = "unlock-recipe",
            recipe= "normal-fish"
          },
          {
            type = "unlock-recipe",
            recipe= "fish-science"
          },
          {
            type = "unlock-recipe",
            recipe= "fish-lab"
          }
        },
        order = "a-a"
    },
    {
        type = "technology",
        name = "heavy-oil-fish",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/fluid-handling.png",
        prerequisites = {"fish-farming"},
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"fish-science", 1},
          },
          time = 10
        },
        max_level = "1",
        effects =
        {
          {
            type = "unlock-recipe",
            recipe= "heavy-oil-fish-mutation"
          },
          {
            type = "unlock-recipe",
            recipe= "heavy-oil-fish"
          },
        },
        order = "a-a"
    },
    {
        type = "technology",
        name = "gamer-juice-fish",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/fluid-handling.png",
        prerequisites = {"fish-farming"},
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"fish-science", 100},
          },
          time = 20
        },
        max_level = "1",
        effects =
        {
          {
            type = "unlock-recipe",
            recipe= "gamer-juice-fish-copper-mutation"
          },
          {
            type = "unlock-recipe",
            recipe= "gamer-juice-fish-copper"
          },
          {
            type = "unlock-recipe",
            recipe= "gamer-juice-fish-iron-mutation"
          },
          {
            type = "unlock-recipe",
            recipe= "gamer-juice-fish-iron"
          },
        },
        order = "a-a"
    },
    {
        type = "technology",
        name = "light-oil-fish",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/fluid-handling.png",
        prerequisites = {"fish-farming"},
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"fish-science", 1},
          },
          time = 10
        },
        max_level = "1",
        effects =
        {
          {
            type = "unlock-recipe",
            recipe= "light-oil-fish-mutation"
          },
          {
            type = "unlock-recipe",
            recipe= "light-oil-fish"
          },
        },
        order = "a-a"
    },
    {
        type = "technology",
        name = "sulfuric-acid-fish",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/fluid-handling.png",
        prerequisites = {"fish-farming"},
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"fish-science", 1},
          },
          time = 10
        },
        max_level = "1",
        effects =
        {
          {
            type = "unlock-recipe",
            recipe= "sulfuric-acid-fish-mutation"
          },
          {
            type = "unlock-recipe",
            recipe= "sulfuric-acid-fish"
          },
        },
        order = "a-a"
    },
    {
        type = "technology",
        name = "molten-iron-fish",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/fluid-handling.png",
        prerequisites = {"fish-farming"},
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"fish-science", 1},
          },
          time = 10
        },
        max_level = "1",
        effects =
        {
          {
            type = "unlock-recipe",
            recipe= "molten-iron-fish-mutation"
          },
          {
            type = "unlock-recipe",
            recipe= "molten-iron-fish"
          },
        },
        order = "a-a"
    },
    {
        type = "technology",
        name = "molten-copper-fish",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/fluid-handling.png",
        prerequisites = {"fish-farming"},
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"fish-science", 1},
          },
          time = 10
        },
        max_level = "1",
        effects =
        {
          {
            type = "unlock-recipe",
            recipe= "molten-copper-fish-mutation"
          },
          {
            type = "unlock-recipe",
            recipe= "molten-copper-fish"
          },
        },
        order = "a-a"
    },
    {
        type = "technology",
        name = "lubricant-fish",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/fluid-handling.png",
        prerequisites = {"fish-farming"},
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"fish-science", 1},
          },
          time = 10
        },
        max_level = "1",
        effects =
        {
          {
            type = "unlock-recipe",
            recipe= "lubricant-fish-mutation"
          },
          {
            type = "unlock-recipe",
            recipe= "lubricant-fish"
          },
          {
            type = "unlock-recipe",
            recipe= "lubricant-fish-equipment"
          },
        },
        order = "a-a"
    },
    {
        type = "technology",
        name = "liquid-rocket-fuel-fish",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/fluid-handling.png",
        prerequisites = {"fish-farming"},
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"fish-science", 1},
          },
          time = 10
        },
        max_level = "1",
        effects =
        {
          {
            type = "unlock-recipe",
            recipe= "liquid-rocket-fuel-fish-mutation"
          },
          {
            type = "unlock-recipe",
            recipe= "liquid-rocket-fuel-fish"
          },
        },
        order = "a-a"
    },
    {
        type = "technology",
        name = "space-water-fish",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/fluid-handling.png",
        prerequisites = {"fish-farming"},
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"fish-science", 1},
          },
          time = 10
        },
        max_level = "1",
        effects =
        {
          {
            type = "unlock-recipe",
            recipe= "space-water-fish-mutation"
          },
          {
            type = "unlock-recipe",
            recipe= "space-water-fish"
          },
        },
        order = "a-a"
    },
    {
        type = "technology",
        name = "vitalic-acid-fish",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/fluid-handling.png",
        prerequisites = {"fish-farming"},
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"fish-science", 1},
          },
          time = 10
        },
        max_level = "1",
        effects =
        {
          {
            type = "unlock-recipe",
            recipe= "vitalic-acid-fish-mutation"
          },
          {
            type = "unlock-recipe",
            recipe= "vitalic-acid-fish"
          },
        },
        order = "a-a"
    },
    {
        type = "technology",
        name = "nutrient-gel-fish",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/fluid-handling.png",
        prerequisites = {"fish-farming"},
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"fish-science", 1},
          },
          time = 10
        },
        max_level = "1",
        effects =
        {
          {
            type = "unlock-recipe",
            recipe= "nutrient-gel-fish-mutation"
          },
          {
            type = "unlock-recipe",
            recipe= "nutrient-gel-fish"
          },
        },
        order = "a-a"
    },
    {
        type = "technology",
        name = "neural-gel-fish",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/fluid-handling.png",
        prerequisites = {"fish-farming"},
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"fish-science", 1},
          },
          time = 10
        },
        max_level = "1",
        effects =
        {
          {
            type = "unlock-recipe",
            recipe= "neural-gel-fish-mutation"
          },
          {
            type = "unlock-recipe",
            recipe= "neural-gel-fish"
          },
        },
        order = "a-a"
    },
    --[[
    {
      type = "technology",
      name = "neural-gel-fish",
      icon_size = 256, icon_mipmaps = 4,
      icon = "__base__/graphics/technology/fluid-handling.png",
      prerequisites = {"fish-farming"},
      unit =
      {
        count_formula = "1",
        ingredients =
        {
          {"fish-science", 1},
        },
        time = 10
      },
      max_level = "1",
      effects =
      {
        {
          type = "unlock-recipe",
          recipe= "samurai-tears-fish-mutation"
        },
        {
          type = "unlock-recipe",
          recipe= "samurai-tears-fish"
        },
      },
      order = "a-a"
    },
    --]]

})

data:extend({
    {
        type = "technology",
        name= "fish-mutation-character-crafting-speed-1",
        prerequisites = {"neural-gel-fish"},
        icon = "__base__/graphics/technology/exoskeleton-equipment.png",
        icon_size = 256, icon_mipmaps = 4,
        effects =
        {
          {
            type = "character-crafting-speed",
            modifier = 0.01
          }
        },
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"neural-gel-fish", 1},
          },
          time = 30
        },
        upgrade = true,
        order = "z"
    },
    {
        type = "technology",
        name= "fish-mutation-distance-1",
        prerequisites = {"neural-gel-fish"},
        icon = "__base__/graphics/technology/exoskeleton-equipment.png",
        icon_size = 256, icon_mipmaps = 4,
        effects =
        {
          {
            type = "character-build-distance",
            modifier = 1
          },
          {
            type = "character-build-distance",
            modifier = 1
          },
          {
            type = "character-reach-distance",
            modifier = 1
          },
          {
            type = "character-resource-reach-distance",
            modifier = 1
          },
          {
            type = "character-item-pickup-distance",
            modifier = 1
          },
        },
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"neural-gel-fish", 1},
          },
          time = 30
        },
        upgrade = true,
        order = "z"
    },
    {
        type = "technology",
        name= "fish-mutation-character-mining-speed-1",
        prerequisites = {"neural-gel-fish"},
        icon = "__base__/graphics/technology/exoskeleton-equipment.png",
        icon_size = 256, icon_mipmaps = 4,
        effects =
        {
          {
            type = "character-mining-speed",
            modifier = 0.01
          }
        },
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"neural-gel-fish", 1},
          },
          time = 30
        },
        upgrade = true,
        order = "z"
    },
    {
        type = "technology",
        name= "fish-mutation-character-running-speed-1",
        prerequisites = {"neural-gel-fish"},
        icon = "__base__/graphics/technology/exoskeleton-equipment.png",
        icon_size = 256, icon_mipmaps = 4,
        effects =
        {
          {
            type = "character-running-speed",
            modifier = 0.01
          }
        },
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"neural-gel-fish", 1},
          },
          time = 30
        },
        upgrade = true,
        order = "z"
    },
    {
        type = "technology",
        name= "fish-mutation-character-inventory-slots-bonus-1",
        prerequisites = {"neural-gel-fish"},
        icon = "__base__/graphics/technology/exoskeleton-equipment.png",
        icon_size = 256, icon_mipmaps = 4,
        effects =
        {
          {
            type = "character-inventory-slots-bonus",
            modifier = 1
          }
        },
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"neural-gel-fish", 1},
          },
          time = 30
        },
        upgrade = true,
        order = "z"
    },
    {
        type = "technology",
        name= "fish-mutation-character-health-bonus-1",
        prerequisites = {"neural-gel-fish"},
        icon = "__base__/graphics/technology/exoskeleton-equipment.png",
        icon_size = 256, icon_mipmaps = 4,
        effects =
        {
          {
            type = "character-health-bonus",
            modifier = 1
          }
        },
        unit =
        {
          count_formula = "1",
          ingredients =
          {
            {"neural-gel-fish", 1},
          },
          time = 30
        },
        upgrade = true,
        order = "z"
    },

})