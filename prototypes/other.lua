local smoke_animations = require("__base__/prototypes/entity/smoke-animations")
local sounds = require("__base__/prototypes/entity/sounds")
local trivial_smoke = smoke_animations.trivial_smoke

require "util"
local math3d = require "math3d"

local napalmtuil = {}

function napalmtuil.foreach(table_, fun_)
    for k, tab in pairs(table_) do fun_(tab) end
    return table_
end

function napalmtuil.create_fire_pictures(opts)
    local fire_blend_mode = opts.blend_mode or "additive"
    local fire_animation_speed = opts.animation_speed or 0.5
    local fire_scale = opts.scale or 1
    local fire_tint = { r = 1, g = 1, b = 1, a = 1 }
    local fire_flags = { "compressed" }
    local retval = {
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-flame-13.png",
            line_length = 8,
            width = 60,
            height = 118,
            frame_count = 25,
            axially_symmetrical = false,
            direction_count = 1,
            blend_mode = fire_blend_mode,
            animation_speed = fire_animation_speed,
            scale = fire_scale,
            tint = fire_tint,
            flags = fire_flags,
            shift = { -0.0390625, -0.90625 }
        },
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-flame-12.png",
            line_length = 8,
            width = 63,
            height = 116,
            frame_count = 25,
            axially_symmetrical = false,
            direction_count = 1,
            blend_mode = fire_blend_mode,
            animation_speed = fire_animation_speed,
            scale = fire_scale,
            tint = fire_tint,
            flags = fire_flags,
            shift = { -0.015625, -0.914065 }
        },
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-flame-11.png",
            line_length = 8,
            width = 61,
            height = 122,
            frame_count = 25,
            axially_symmetrical = false,
            direction_count = 1,
            blend_mode = fire_blend_mode,
            animation_speed = fire_animation_speed,
            scale = fire_scale,
            tint = fire_tint,
            flags = fire_flags,
            shift = { -0.0078125, -0.90625 }
        },
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-flame-10.png",
            line_length = 8,
            width = 65,
            height = 108,
            frame_count = 25,
            axially_symmetrical = false,
            direction_count = 1,
            blend_mode = fire_blend_mode,
            animation_speed = fire_animation_speed,
            scale = fire_scale,
            tint = fire_tint,
            flags = fire_flags,
            shift = { -0.0625, -0.64844 }
        },
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-flame-09.png",
            line_length = 8,
            width = 64,
            height = 101,
            frame_count = 25,
            axially_symmetrical = false,
            direction_count = 1,
            blend_mode = fire_blend_mode,
            animation_speed = fire_animation_speed,
            scale = fire_scale,
            tint = fire_tint,
            flags = fire_flags,
            shift = { -0.03125, -0.695315 }
        },
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-flame-08.png",
            line_length = 8,
            width = 50,
            height = 98,
            frame_count = 32,
            axially_symmetrical = false,
            direction_count = 1,
            blend_mode = fire_blend_mode,
            animation_speed = fire_animation_speed,
            scale = fire_scale,
            tint = fire_tint,
            flags = fire_flags,
            shift = { -0.0546875, -0.77344 }
        },
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-flame-07.png",
            line_length = 8,
            width = 54,
            height = 84,
            frame_count = 32,
            axially_symmetrical = false,
            direction_count = 1,
            blend_mode = fire_blend_mode,
            animation_speed = fire_animation_speed,
            scale = fire_scale,
            tint = fire_tint,
            flags = fire_flags,
            shift = { 0.015625, -0.640625 }
        },
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-flame-06.png",
            line_length = 8,
            width = 65,
            height = 92,
            frame_count = 32,
            axially_symmetrical = false,
            direction_count = 1,
            blend_mode = fire_blend_mode,
            animation_speed = fire_animation_speed,
            scale = fire_scale,
            tint = fire_tint,
            flags = fire_flags,
            shift = { 0, -0.83594 }
        },
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-flame-05.png",
            line_length = 8,
            width = 59,
            height = 103,
            frame_count = 32,
            axially_symmetrical = false,
            direction_count = 1,
            blend_mode = fire_blend_mode,
            animation_speed = fire_animation_speed,
            scale = fire_scale,
            tint = fire_tint,
            flags = fire_flags,
            shift = { 0.03125, -0.882815 }
        },
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-flame-04.png",
            line_length = 8,
            width = 67,
            height = 130,
            frame_count = 32,
            axially_symmetrical = false,
            direction_count = 1,
            blend_mode = fire_blend_mode,
            animation_speed = fire_animation_speed,
            scale = fire_scale,
            tint = fire_tint,
            flags = fire_flags,
            shift = { 0.015625, -1.109375 }
        },
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-flame-03.png",
            line_length = 8,
            width = 74,
            height = 117,
            frame_count = 32,
            axially_symmetrical = false,
            direction_count = 1,
            blend_mode = fire_blend_mode,
            animation_speed = fire_animation_speed,
            scale = fire_scale,
            tint = fire_tint,
            flags = fire_flags,
            shift = { 0.046875, -0.984375 }
        },
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-flame-02.png",
            line_length = 8,
            width = 74,
            height = 114,
            frame_count = 32,
            axially_symmetrical = false,
            direction_count = 1,
            blend_mode = fire_blend_mode,
            animation_speed = fire_animation_speed,
            scale = fire_scale,
            tint = fire_tint,
            flags = fire_flags,
            shift = { 0.0078125, -0.96875 }
        },
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-flame-01.png",
            line_length = 8,
            width = 66,
            height = 119,
            frame_count = 32,
            axially_symmetrical = false,
            direction_count = 1,
            blend_mode = fire_blend_mode,
            animation_speed = fire_animation_speed,
            scale = fire_scale,
            tint = fire_tint,
            flags = fire_flags,
            shift = { -0.0703125, -1.039065 }
        },
    }
    return napalmtuil.foreach(retval, function(tab)
        if tab.shift and tab.scale then tab.shift = { tab.shift[1] * tab.scale, tab.shift[2] * tab.scale } end
    end)
end

local napalmFire = table.deepcopy(data.raw["fire"]["fire-flame"])
napalmFire.name = "napalm-flame"
napalmFire.initial_lifetime = 600
napalmFire.damage_per_tick = { amount = 20 / 60, type = "fire" }
napalmFire.on_fuel_added_action = nil
napalmFire.damage_multiplier_decrease_per_tick = 0.0005
napalmFire.maximum_damage_multiplier = 1
napalmFire.fade_out_duration = 60
napalmFire.lifetime_increase_by = 0
napalmFire.pictures = napalmtuil.create_fire_pictures({ blend_mode = "normal", animation_speed = 1, scale = 0.5 })

local long_smoke_p = table.deepcopy(data.raw["projectile"]["poison-capsule"])
long_smoke_p.name = "long-smoke-projectile"
long_smoke_p.action[1].action_delivery.target_effects[1].entity_name = "long-smoke"

local long_smoke = table.deepcopy(data.raw["smoke-with-trigger"]["poison-cloud"])
long_smoke.name = "long-smoke"
long_smoke.duration = 60 * 3600
long_smoke.action.action_delivery.target_effects.action.action_delivery.target_effects.damage.amount = 30

data:extend({
    napalmFire,
    long_smoke,
    long_smoke_p,
    {
        type = "projectile",
        name = "molotov-cocktail",
        flags = { "not-on-map" },
        acceleration = 0.005,
        action = {
            {
                type = "direct",
                action_delivery = {
                    type = "instant",
                    target_effects = {
                        {
                            type = "create-entity",
                            entity_name = "fiery-explosion"
                        },
                        {
                            type = "create-entity",
                            entity_name = "napalm-scorchmark",
                            check_buildability = true
                        },
                        {
                            type = "play-sound",
                            sound = {
                                {
                                    filename = "__kupil-mujik-shlyapu__/sound/explosion/glass-breaking.ogg",
                                    volume = 1
                                }
                            }
                        }
                    }
                }
            },
            {
                type = "area",
                radius = 5,
                action_delivery = {
                    type = "instant",
                    target_effects = {
                        {
                            type = "damage",
                            damage = { amount = 5, type = "physical" }
                        }
                    }
                }
            },
            {
                type = "cluster",
                cluster_count = 11,
                distance = 5,
                distance_deviation = 4,
                action_delivery = {
                    type = "projectile",
                    projectile = "molotov-splash",
                    direction_deviation = 0.6,
                    starting_speed = 0.25,
                    starting_speed_deviation = 0.4
                }
            }
        },
        light = { intensity = 0.5, size = 4 },
        animation = {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/molotov/molotov-in-flight.png",
            frame_count = 1,
            width = 24,
            height = 24,
            priority = "high"
        },
        shadow = {
            filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
            frame_count = 1,
            width = 24,
            height = 24,
            priority = "high"
        }
    },
    {
        type = "projectile",
        name = "molotov-splash",
        flags = { "not-on-map" },
        acceleration = 0.005,
        action = {
            {
                type = "direct",
                action_delivery = {
                    type = "instant",
                    target_effects = {
                        {
                            type = "create-entity",
                            entity_name = "fiery-splash"
                        },
                        {
                            type = "create-entity",
                            entity_name = "napalm-scorchmark",
                            check_buildability = true
                        }
                    }
                }
            },
            {
                type = "area",
                radius = 7,
                action_delivery = {
                    type = "instant",
                    target_effects = {
                        {
                            type = "damage",
                            damage = { amount = 20, type = "fire" }
                        },
                        {
                            type = "create-entity",
                            entity_name = "fiery-splash"
                        },
                        {
                            type = "create-fire",
                            entity_name = "napalm-flame"
                        },
                        {
                            type = "create-sticker",
                            sticker = "napalm-sticker"
                        }
                    }
                }
            }
        },
        light = { intensity = 0.5, size = 4 },
        animation = {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/molotov/molotov-splash.png",
            frame_count = 1,
            width = 24,
            height = 24,
            priority = "high"
        },
        shadow = {
            filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
            frame_count = 1,
            width = 24,
            height = 24,
            priority = "high"
        }
    },
    {
        type = "explosion",
        name = "fiery-splash",
        flags = { "not-on-map" },
        animations =
        {
            {
                filename = "__kupil-mujik-shlyapu__/graphics/entity/explosion/fiery-splash.png",
                priority = "extra-high",
                width = 92,
                height = 66,
                frame_count = 15,
                line_length = 5,
                shift = { -0.437, 0.5 },
                animation_speed = 0.35
            }
        },
        sound =
        {
            aggregation =
            {
                max_count = 1,
                remove = true
            },
            variations =
            {
                {
                    filename = "__kupil-mujik-shlyapu__/sound/explosion/fiery-splash.ogg",
                    volume = 1.5
                }
            }
        },
    },
    {
        type = "explosion",
        name = "fiery-explosion",
        flags = { "not-on-map" },
        animations =
        {
            {
                filename = "__kupil-mujik-shlyapu__/graphics/entity/explosion/fiery-explosion.png",
                priority = "extra-high",
                flags = { "compressed" },
                width = 197,
                height = 245,
                frame_count = 47,
                line_length = 6,
                axially_symmetrical = false,
                direction_count = 1,
                shift = { 0.1875, -0.75 },
                animation_speed = 0.3
            }
        },
        light = { intensity = 1, size = 50, color = { r = 1.0, g = 1.0, b = 1.0 } },
        sound =
        {
            aggregation =
            {
                max_count = 1,
                remove = true
            },
            variations =
            {
                {
                    filename = "__kupil-mujik-shlyapu__/sound/explosion/fiery-explosion.ogg",
                    volume = 1.8
                }
            }
        },
        created_effect =
        {
            type = "direct",
            action_delivery =
            {
                type = "instant",
                target_effects =
                {
                    {
                        type = "create-particle",
                        repeat_count = 5,
                        particle_name = "explosion-remnants-particle",
                        initial_height = 0.5,
                        speed_from_center = 0.06,
                        speed_from_center_deviation = 0.1,
                        initial_vertical_speed = 0.06,
                        initial_vertical_speed_deviation = 0.1,
                        offset_deviation = { { -0.2, -0.2 }, { 0.2, 0.2 } }
                    }
                }
            }
        }
    },
    {
        type = "corpse",
        name = "napalm-scorchmark",
        icon = "__base__/graphics/icons/small-scorchmark.png",
        icon_size = 32,
        flags = { "placeable-neutral", "not-on-map" },
        selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_width = 1,
        tile_height = 1,
        selectable_in_game = false,
        subgroup = "remnants",
        order = "d[remnants]-b[scorchmark]-b[fire]",
        time_before_removed = 60 * 30, -- 30 seconds
        final_render_layer = "remnants",
        animation =
        {
            {
                width = 115,
                height = 56,
                frame_count = 1,
                direction_count = 1,
                filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-scorchmark.png",
            },
            {
                width = 115,
                height = 56,
                frame_count = 1,
                direction_count = 1,
                filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-scorchmark.png",
                y = 56
            },
      
            {
                width = 115,
                height = 56,
                frame_count = 1,
                direction_count = 1,
                filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-scorchmark.png",
                y = 112
            },
            {
                width = 115,
                height = 56,
                frame_count = 1,
                direction_count = 1,
                filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-scorchmark.png",
                y = 168
            },
            {
                width = 115,
                height = 56,
                frame_count = 1,
                direction_count = 1,
                filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-scorchmark.png",
                y = 224
            },
            {
                width = 115,
                height = 56,
                frame_count = 1,
                direction_count = 1,
                filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-scorchmark.png",
                y = 280
            },
            {
                width = 115,
                height = 56,
                frame_count = 1,
                direction_count = 1,
                filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-scorchmark.png",
                y = 336
            },
            {
                width = 115,
                height = 56,
                frame_count = 1,
                direction_count = 1,
                filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-scorchmark.png",
                y = 392
            },
            {
                width = 115,
                height = 56,
                frame_count = 1,
                direction_count = 1,
                filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-scorchmark.png",
                y = 448
            }
        }
    },
    {
        type = "sticker",
        name = "napalm-sticker",
        flags = {"not-on-map"},

        animation =
        {
            filename = "__kupil-mujik-shlyapu__/graphics/entity/napalm/napalm-flame-13.png",
            line_length = 8,
            width = 60,
            height = 118,
            frame_count = 25,
            axially_symmetrical = false,
            direction_count = 1,
            blend_mode = "normal",
            animation_speed = 1,
            scale = 0.2,
            tint = { r = 0.5, g = 0.5, b = 0.5, a = 0.18 }, --{ r = 1, g = 1, b = 1, a = 0.35 },
            shift = math3d.vector2.mul({-0.078125, -1.8125}, 0.1),
        },

        duration_in_ticks = 90 * 60,
        target_movement_modifier = 0.7,
        damage_per_tick = { amount = 150 / 60, type = "fire" },
        spread_fire_entity = "fire-flame-on-tree",
        fire_spread_cooldown = 30,
        fire_spread_radius = 0.75,
    },
    {
        type = "fuel-category",
        name = "fish-fuel",
        localised_name = "Fish",
        localised_description = "mmm tasty"
    },
    {
        type = "fuel-category",
        name = "dead-fuel",
        localised_name = "D3AD",
        localised_description = "edgy"
    },
    {
        type = "fuel-category",
        name = "sus-battery",
        localised_name = "sus batteries",
        localised_description = "this will probably kill you"
    },
    trivial_smoke
    {
      name = "magenta-smoke-big",
      color = {r = 1, g = 0, b = 1, a = 1},
      start_scale = 0.5,
      fade_in_duration = 30
    },
    trivial_smoke
    {
      name = "cyan-smoke-big",
      color = {r = 143/255, g = 249/255, b = 237/255, a = 1},
      start_scale = 0.5,
      fade_in_duration = 30
    },

})