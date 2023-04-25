require ("util")

function car_spitter_amimations()
    local scale = scale_spitter_behemoth
    local tint1 = tint_1_spitter_behemoth

    return
    {
      layers=
      {
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/spitter-run-01.png",
            "__base__/graphics/entity/spitter/spitter-run-02.png",
            "__base__/graphics/entity/spitter/spitter-run-03.png",
            "__base__/graphics/entity/spitter/spitter-run-04.png"
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 124,
          height = 110,
          frame_count = 16,
          direction_count = 16,
          shift = util.mul_shift(util.by_pixel(0, -12), scale),
          scale = scale,
          hr_version =
          {
            filenames =
            {
              "__base__/graphics/entity/spitter/hr-spitter-run-01.png",
              "__base__/graphics/entity/spitter/hr-spitter-run-02.png",
              "__base__/graphics/entity/spitter/hr-spitter-run-03.png",
              "__base__/graphics/entity/spitter/hr-spitter-run-04.png"
            },
            slice = 8,
            lines_per_file = 8,
            line_length = 8,
            width = 248,
            height = 220,
            frame_count = 16,
            shift = util.mul_shift(util.by_pixel(0, -12), scale),
            direction_count = 16,
            scale = 0.5 * scale
          }
        },
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/spitter-run-mask1-01.png",
            "__base__/graphics/entity/spitter/spitter-run-mask1-02.png",
            "__base__/graphics/entity/spitter/spitter-run-mask1-03.png",
            "__base__/graphics/entity/spitter/spitter-run-mask1-04.png"
          },
          slice = 8,
          lines_per_file = 8,
          flags = { "mask" },
          line_length = 8,
          width = 124,
          height = 100,
          frame_count = 16,
          direction_count = 16,
          shift = util.mul_shift(util.by_pixel(0, -18), scale),
          scale = scale,
          tint = tint1,
          hr_version =
          {
            filenames =
            {
              "__base__/graphics/entity/spitter/hr-spitter-run-mask1-01.png",
              "__base__/graphics/entity/spitter/hr-spitter-run-mask1-02.png",
              "__base__/graphics/entity/spitter/hr-spitter-run-mask1-03.png",
              "__base__/graphics/entity/spitter/hr-spitter-run-mask1-04.png"
            },
            slice = 8,
            lines_per_file = 8,
            line_length = 8,
            width = 248,
            height = 194,
            frame_count = 16,
            shift = util.mul_shift(util.by_pixel(0, -17), scale),
            direction_count = 16,
            scale = 0.5 * scale,
            tint = tint1
          }
        },
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/spitter-run-mask2-01.png",
            "__base__/graphics/entity/spitter/spitter-run-mask2-02.png",
            "__base__/graphics/entity/spitter/spitter-run-mask2-03.png",
            "__base__/graphics/entity/spitter/spitter-run-mask2-04.png"
          },
          slice = 8,
          lines_per_file = 8,
          flags = { "mask" },
          line_length = 8,
          width = 124,
          height = 98,
          frame_count = 16,
          direction_count = 16,
          shift = util.mul_shift(util.by_pixel(0, -18), scale),
          scale = scale,
          apply_runtime_tint = true,
          hr_version =
          {
            filenames =
            {
              "__base__/graphics/entity/spitter/hr-spitter-run-mask2-01.png",
              "__base__/graphics/entity/spitter/hr-spitter-run-mask2-02.png",
              "__base__/graphics/entity/spitter/hr-spitter-run-mask2-03.png",
              "__base__/graphics/entity/spitter/hr-spitter-run-mask2-04.png"
            },
            slice = 8,
            lines_per_file = 8,
            line_length = 8,
            width = 252,
            height = 196,
            frame_count = 16,
            shift = util.mul_shift(util.by_pixel(-1, -18), scale),
            direction_count = 16,
            scale = 0.5 * scale,
            apply_runtime_tint = true,
          }
        },
        {
          filenames =
          {
            "__base__/graphics/entity/spitter/spitter-run-shadow-01.png",
            "__base__/graphics/entity/spitter/spitter-run-shadow-02.png",
            "__base__/graphics/entity/spitter/spitter-run-shadow-03.png",
            "__base__/graphics/entity/spitter/spitter-run-shadow-04.png"
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 154,
          height = 88,
          frame_count = 16,
          shift = util.mul_shift(util.by_pixel(16, 0), scale),
          direction_count = 16,
          scale = scale,
          draw_as_shadow = true,
          hr_version =
          {
            filenames =
            {
              "__base__/graphics/entity/spitter/hr-spitter-run-shadow-01.png",
              "__base__/graphics/entity/spitter/hr-spitter-run-shadow-02.png",
              "__base__/graphics/entity/spitter/hr-spitter-run-shadow-03.png",
              "__base__/graphics/entity/spitter/hr-spitter-run-shadow-04.png"
            },
            slice = 8,
            lines_per_file = 8,
            line_length = 8,
            width = 306,
            height = 180,
            frame_count = 16,
            shift = util.mul_shift(util.by_pixel(16, -1), scale),
            direction_count = 16,
            scale = 0.5 * scale,
            draw_as_shadow = true
          }
        }
      }
    }
end

function car_biter_animation()
    local scale = behemoth_biter_scale
    local tint1 = behemoth_biter_tint1
    return
    {
      layers=
      {
        {
          filenames =
          {
            "__base__/graphics/entity/biter/biter-run-01.png",
            "__base__/graphics/entity/biter/biter-run-02.png",
            "__base__/graphics/entity/biter/biter-run-03.png",
            "__base__/graphics/entity/biter/biter-run-04.png"
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 202,
          height = 158,
          frame_count = 16,
          direction_count = 16,
          shift = util.mul_shift(util.by_pixel(-2, -6), scale),
          scale = scale,
          hr_version =
          {
            filenames =
            {
              "__base__/graphics/entity/biter/hr-biter-run-01.png",
              "__base__/graphics/entity/biter/hr-biter-run-02.png",
              "__base__/graphics/entity/biter/hr-biter-run-03.png",
              "__base__/graphics/entity/biter/hr-biter-run-04.png"
            },
            slice = 8,
            lines_per_file = 8,
            line_length = 8,
            width = 398,
            height = 310,
            frame_count = 16,
            shift = util.mul_shift(util.by_pixel(-1, -5), scale),
            direction_count = 16,
            scale = 0.5 * scale
          }
        },
        {
          filenames =
          {
            "__base__/graphics/entity/biter/biter-run-mask1-01.png",
            "__base__/graphics/entity/biter/biter-run-mask1-02.png",
            "__base__/graphics/entity/biter/biter-run-mask1-03.png",
            "__base__/graphics/entity/biter/biter-run-mask1-04.png"
          },
          slice = 8,
          lines_per_file = 8,
          flags = { "mask" },
          line_length = 8,
          width = 118,
          height = 94,
          frame_count = 16,
          direction_count = 16,
          shift = util.mul_shift(util.by_pixel(0, -38), scale),
          scale = scale,
          tint = tint1,
          hr_version =
          {
            filenames =
            {
              "__base__/graphics/entity/biter/hr-biter-run-mask1-01.png",
              "__base__/graphics/entity/biter/hr-biter-run-mask1-02.png",
              "__base__/graphics/entity/biter/hr-biter-run-mask1-03.png",
              "__base__/graphics/entity/biter/hr-biter-run-mask1-04.png"
            },
            slice = 8,
            lines_per_file = 8,
            line_length = 8,
            width = 238,
            height = 182,
            frame_count = 16,
            shift = util.mul_shift(util.by_pixel(-1, -37), scale),
            direction_count = 16,
            scale = 0.5 * scale,
            tint = tint1
          }
        },
        {
          filenames =
          {
            "__base__/graphics/entity/biter/biter-run-mask2-01.png",
            "__base__/graphics/entity/biter/biter-run-mask2-02.png",
            "__base__/graphics/entity/biter/biter-run-mask2-03.png",
            "__base__/graphics/entity/biter/biter-run-mask2-04.png"
          },
          slice = 8,
          lines_per_file = 8,
          flags = { "mask" },
          line_length = 8,
          width = 120,
          height = 92,
          frame_count = 16,
          direction_count = 16,
          shift = util.mul_shift(util.by_pixel(-2, -38), scale),
          scale = scale,
          apply_runtime_tint = true,
          hr_version =
          {
            filenames =
            {
              "__base__/graphics/entity/biter/hr-biter-run-mask2-01.png",
              "__base__/graphics/entity/biter/hr-biter-run-mask2-02.png",
              "__base__/graphics/entity/biter/hr-biter-run-mask2-03.png",
              "__base__/graphics/entity/biter/hr-biter-run-mask2-04.png"
            },
            slice = 8,
            lines_per_file = 8,
            line_length = 8,
            width = 232,
            height = 184,
            frame_count = 16,
            shift = util.mul_shift(util.by_pixel(0, -38), scale),
            direction_count = 16,
            scale = 0.5 * scale,
            apply_runtime_tint = true,
          }
        },
        {
          filenames =
          {
            "__base__/graphics/entity/biter/biter-run-shadow-01.png",
            "__base__/graphics/entity/biter/biter-run-shadow-02.png",
            "__base__/graphics/entity/biter/biter-run-shadow-03.png",
            "__base__/graphics/entity/biter/biter-run-shadow-04.png"
          },
          slice = 8,
          lines_per_file = 8,
          line_length = 8,
          width = 216,
          height = 144,
          frame_count = 16,
          shift = util.mul_shift(util.by_pixel(8, 0), scale),
          direction_count = 16,
          scale = scale,
          draw_as_shadow = true,
          hr_version =
          {
            filenames =
            {
              "__base__/graphics/entity/biter/hr-biter-run-shadow-01.png",
              "__base__/graphics/entity/biter/hr-biter-run-shadow-02.png",
              "__base__/graphics/entity/biter/hr-biter-run-shadow-03.png",
              "__base__/graphics/entity/biter/hr-biter-run-shadow-04.png"
            },
            slice = 8,
            lines_per_file = 8,
            line_length = 8,
            width = 432,
            height = 292,
            frame_count = 16,
            shift = util.mul_shift(util.by_pixel(8, -1), scale),
            direction_count = 16,
            scale = 0.5 * scale,
            draw_as_shadow = true
          }
        }
      }
    }
  end