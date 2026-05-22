os.execute("hyprctl")
hl.config({
    master = {
        new_status = "master",
    },

    dwindle = {
        preserve_split = true, -- You probably want this
    },

    scrolling = {
        fullscreen_on_one_column = true,
    },

    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },

    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },

    general = {
      gaps_in  = 5,
      gaps_out = 20,

      border_size = 3,

      col = {
          active_border   = config.colourscheme.base0A,
          inactive_border = config.colourscheme.base00,
      },

      -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
      resize_on_border = true,

      -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
      allow_tearing = false,

      layout = "master",
    },

    decoration = {
        rounding       = 8,
        rounding_power = 3,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = { enabled = false },

        blur = {
            enabled   = true,
            size      = 2,
            passes    = 2,
            vibrancy  = -0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

local M = {}
return M
