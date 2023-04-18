data:extend({
    {
        type = "item",
        name = "dead-reactor",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/dead-reactor.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "energy",
        order = "f[dead-energy]-a[reactor]",
        place_result = "dead-reactor",
        stack_size = 10
    },
    {
        type = "item",
        name = "dead-matter",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/dead-matter.png",
        icon_size = 64, icon_mipmaps = 1,
        subgroup = "raw-material",
        order = "z[dead-energy]",
        stack_size = 500
    },
    {
        type = "item",
        name = "dead-data",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/dead-data.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "space-related",
        order = "z[dead-data]",
        stack_size = 1,
        rocket_launch_product = {name="dead-matter", amount=10000},
    },
    {
        type = "item",
        name = "dead-data-prepare",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/dead-data-prepare.png",
        icon_size = 64, icon_mipmaps = 1,
        subgroup = "raw-material",
        order = "z[dead-data-prepare]",
        stack_size = 100,
    },
    {
        type = "item",
        name = "kettle",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/kettle.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "energy",
        order = "z[dead-energy]-c[tear-exchanger]",
        place_result = "kettle",
        stack_size = 50
    },
    {
        type = "item",
        name = "china",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/china.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "energy",
        order = "z[dead-energy]-d[tear-turbine]",
        place_result = "china",
        stack_size = 50
    },
    {
        type = "item",
        name = "dead-fuel-cell",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/dead-matter-fuel-cell.png",
        icon_size = 64, icon_mipmaps = 4,
        fuel_glow_color = {r=1, g=0, b=0, a=1},
        pictures =
        {
        layers =
        {
            {
            size = 64,
            filename = "__kupil-mujik-shlyapu__/graphics/icons/dead-matter-fuel-cell.png",
            scale = 0.25,
            mipmap_count = 4
            },
            {
            draw_as_light = true,
            flags = {"light"},
            size = 64,
            filename = "__base__/graphics/icons/uranium-fuel-cell-light.png",
            scale = 0.25,
            mipmap_count = 4
            }
        }
        },
        subgroup = "intermediate-product",
        order = "z[dead-energy]-a[dead-fuel-cell]",
        fuel_category = "dead-fuel",
        burnt_result = "used-up-dead-fuel-cell",
        fuel_value = "16GJ",
        stack_size = 50
    },
    {
        type = "item",
        name = "used-up-dead-fuel-cell",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/used-up-dead-matter-fuel-cell.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "intermediate-product",
        order = "z[used-up-dead-fuel-cell]",
        stack_size = 50
    },
    {
        type = "item",
        name = "glass-pipe",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/glass-pipe.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "energy",
        order = "f[dead-energy]-b[glass-pipe]",
        place_result = "glass-pipe",
        stack_size = 50
      }, 
      {
        type = "item",
        name = "head-crab",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/head-crab.png",
        icon_size = 194, icon_mipmaps = 1,
        placed_as_equipment_result = "head-crab",
        subgroup = "equipment",
        order = "z[head-crab]",
        default_request_amount = 1,
        stack_size = 1
    },
      {
        type = "night-vision-equipment",
        name = "head-crab",
        sprite =
        {
          filename = "__kupil-mujik-shlyapu__/graphics/icons/head-crab.png",
          width = 194,
          height = 194,
          priority = "medium",
        },
        shape =
        {
          width = 8,
          height = 8,
          type = "full"
        },
        energy_input = "0kW",
        color_lookup = {{0, "__core__/graphics/color_luts/lut-sunset.png"}},
        energy_source =
        {
          type = "electric",
          buffer_capacity = "0kJ",
          input_flow_limit = "0kW",
          usage_priority = "primary-input"
        },
        energy_consumption = "0kW",
        categories = {"armor-jetpack"},
        desaturation_params = 
		{ 
		  smoothstep_min = 0.1,
		  smoothstep_max = 0.7,
		  minimum = 0.3,
		  maximum = 1.0
		},
		light_params = 
		{ 
		  smoothstep_min = 0.1,
		  smoothstep_max = 0.7,
		  minimum = 0.666,
		  maximum = 1.0,
		},
    },
    {
      type = "fluid",
      name = "dead-matter-solution",
      default_temperature = 0,
      max_temperature = 0,
      heat_capacity = "0J",
      base_color = {r=1, g=0, b=0},
      flow_color = {r=1, g=0, b=0},
      icon = "__kupil-mujik-shlyapu__/graphics/icons/solution.png",
      icon_size = 64, icon_mipmaps = 4,
      order = "z[dead-matter-solution]"
    },
    {
        type = "fluid",
        name = "bad-bronze",
        default_temperature = 850,
        max_temperature = 1050,
        heat_capacity = "420J",
        base_color = {r=202/255, g=162/255, b=93/255},
        flow_color = {r=202/255, g=162/255, b=93/255},
        icon = "__kupil-mujik-shlyapu__/graphics/icons/bad-bronze.png",
        icon_size = 64, icon_mipmaps = 4,
        order = "z[bad-bronze]"
      },
      {
        type = "item",
        name = "copper-iron-plate",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/copper-iron.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "raw-material",
        order = "z[copper-iron]",
        stack_size = 100
      },
      {
        type = "item",
        name = "iron-copper-plate",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/iron-copper.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "raw-material",
        order = "z[iron-copper]",
        stack_size = 100
      },
      {
        type = "item",
        name = "dead-plate",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/dead-plate.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "raw-material",
        order = "z[dead-plate]",
        stack_size = 5
      },

      {
        type = "item",
        name = "dead-logistic-drone",
        icon = "__kupil-mujik-shlyapu__/graphics/icons/dead-l.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "logistic-network",
        order = "z[dead-logistics]",
        place_result = "dead-logistic-drone",
        stack_size = 50
    },
    {
      type = "item",
      name = "dead-construction-drone",
      icon = "__kupil-mujik-shlyapu__/graphics/icons/dead-c.png",
      icon_size = 64, icon_mipmaps = 4,
      subgroup = "logistic-network",
      order = "z[dead-construction]",
      place_result = "dead-construction-drone",
      stack_size = 50
    },
})