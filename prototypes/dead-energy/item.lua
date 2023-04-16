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
        icon_size = 64, icon_mipmaps = 4,
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
})