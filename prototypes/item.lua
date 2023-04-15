data:extend(
{
  {
    type = "item-with-entity-data",
    name = "brr",
    icon = "__kupil-mujik-shlyapu__/graphics/icons/brr.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "bullet",
    order = "b[personal-transport]-z[brr]",
    place_result = "brr",
    stack_size = 1
  },
  {
    type = "item-with-entity-data",
    name = "invisicar",
    icon = "__kupil-mujik-shlyapu__/graphics/icons/empty.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "bullet",
    order = "b[personal-transport]-z[invisicar]",
    place_result = "invisicar",
    stack_size = 1
  },
  {
    type = "item",
    name = "interesting-battery",
    icon = "__kupil-mujik-shlyapu__/graphics/icons/interesting-battery.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "b[zzz]-z[zzz]",
    stack_size = 10
  },
  {
    type = "item",
    name = "interesting-battery-charged",
    icon = "__kupil-mujik-shlyapu__/graphics/icons/interesting-battery-charged.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "b[zzzz]-z[zzzz]",
    stack_size = 10,
    fuel_category = "sus-battery",
    fuel_value = "100MJ",
    burnt_result = "interesting-battery"
  },
  {
    type = "item",
    name = "interesting-battery-discharger",
    icon = "__kupil-mujik-shlyapu__/graphics/icons/interesting-battery-discharger.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy",
    order = "b[zzzzz]-z[zzzzz]",
    stack_size = 50,
    place_result = "interesting-battery-discharger"
  },
  {
    type = "item",
    name = "interesting-battery-charger",
    icon = "__kupil-mujik-shlyapu__/graphics/icons/interesting-battery-charger.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy",
    order = "b[zzzzz]-z[zzzzz]",
    stack_size = 50,
    place_result = "interesting-battery-charger"
  },
  {
    type = "item",
    name = "living-wall",
    icon = "__kupil-mujik-shlyapu__/graphics/icons/living-wall.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "defensive-structure",
    order = "zz[living-wall]",
    stack_size = 200,
    place_result = "living-wall"
  },
  {
    type = "item",
    name = "radar-mk2",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "defensive-structure",
    order = "d[radarmk2]-a[radarmk2]",
    place_result = "radar-mk2",
    stack_size = 50
  },
  {
    type = "item",
    name = "robocharger",
    icon = "__base__/graphics/icons/roboport.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "logistic-network",
    order = "zc[signal]-a[robocharger]",
    place_result = "robocharger",
    stack_size = 10
  },
  {
    type = "item",
    name = "kettle",
    icon = "__base__/graphics/icons/heat-boiler.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy",
    order = "z[dead-matter-energy]-c[tear-exchanger]",
    place_result = "kettle",
    stack_size = 50
  },
  {
    type = "item",
    name = "china",
    icon = "__base__/graphics/icons/steam-turbine.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy",
    order = "z[dead-matter-energy]-d[tear-turbine]",
    place_result = "china",
    stack_size = 50
  },
  {
    type = "item",
    name = "uranium-fuel-cell",
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
    order = "z[dead-matter-processing]-a[uranium-fuel-cell]",
    fuel_category = "dead-matter",
    burnt_result = "used-up-uranium-fuel-cell",
    fuel_value = "16GJ",
    stack_size = 50
  },
  {
    type = "item",
    name = "used-up-uranium-fuel-cell",
    icon = "__kupil-mujik-shlyapu__/graphics/icons/used-up-dead-matter-fuel-cell.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "z[used-up-dead-matter-fuel-cell]",
    stack_size = 50
  },
  {
    type = "item",
    name = "pipe-to-ground",
    icon = "__kupil-mujik-shlyapu__/graphics/icons/steel-pipe-to-ground.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-b[steel-pipe-to-ground]",
    place_result = "steel-pipe-to-ground",
    stack_size = 50
  },
  {
    type = "item",
    name = "pipe",
    icon = "__kupil-mujik-shlyapu__/graphics/icons/steel-pipe.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-a[steel-pipe]",
    place_result = "steel-pipe",
    stack_size = 100
  },
  {
    type = "item",
    name = "storage-tank",
    icon = "__kupil-mujik-shlyapu__/graphics/icons/steel-storage-tank.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "storage",
    order = "b[fluid]-a[steel-storage-tank]",
    place_result = "steel-storage-tank",
    stack_size = 50
  },
})