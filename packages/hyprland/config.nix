{ ... }:
/* lua */ ''
  ------------------
  ---- MONITORS ----
  ------------------

  -- See https://wiki.hypr.land/Configuring/Basics/Monitors/
  hl.monitor({
      output   = "",
      mode     = "preferred",
      position = "auto",
      scale    = "auto",
  })

  ---------------------
  ---- MY PROGRAMS ----
  ---------------------

  -- Set programs that you use
  local terminal    = "kitty"
  local menu        = "hyprlauncher"

  -------------------------------
  ---- ENVIRONMENT VARIABLES ----
  -------------------------------

  -- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

  hl.env("XCURSOR_SIZE", "24")
  hl.env("HYPRCURSOR_SIZE", "24")

  -- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
  hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
  hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
  hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
  hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
  hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

  -- Default springs
  hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

  hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
  hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
  hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
  hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
  hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
  hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
  hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
  hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
  hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
  hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
  hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
  hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
  hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
  hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
  hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
  hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
  hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

  -- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
  -- "Smart gaps" / "No gaps when only"
  -- uncomment all if you wish to use that.
  hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
  hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
  hl.window_rule({
      name  = "no-gaps-wtv1",
      match = { float = false, workspace = "w[tv1]" },
      border_size = 0,
      rounding    = 0,
  })
  hl.window_rule({
      name  = "no-gaps-f1",
      match = { float = false, workspace = "f[1]" },
      border_size = 0,
      rounding    = 0,
  })

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
            active_border   = "#ebdbb2", -- Gruvbox Foreground
            inactive_border = "#282828", -- Gruvbox Background
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

  hl.gesture({
      fingers = 3,
      direction = "horizontal",
      action = "workspace"
  })

  hl.device({
      name        = "epic-mouse-v1",
      sensitivity = -0.5,
  })

  ---------------------
  ---- KEYBINDINGS ----
  ---------------------

  local mainMod = "SUPER" -- Sets "Windows" key as main modifier
  local sMod = "SHIFT + SUPER" -- Sets "Windows" key as main modifier
  local noMod = ""

  local general_binds = {
      {mainMod, "Tab",        hl.dsp.exec_cmd,                 {menu}},
      {sMod,    "C",          hl.dsp.window.close,             {}},
      {mainMod, "Space",      hl.dsp.exec_cmd,                 {terminal}},
      {mainMod, "M",          hl.dsp.exec_cmd,                 {"command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"}},
      {mainMod, "V",          hl.dsp.window.float,             {{action = "toggle"}}},
      {mainMod, "R",          hl.dsp.exec_cmd,                 {menu}},
      {mainMod, "S",          hl.dsp.workspace.toggle_special, {"magic"}},
      {sMod,    "S",          hl.dsp.window.move,              {{workspace = "special:magic"}}},
      {mainMod, "mouse_down", hl.dsp.focus,                    {{workspace = "e+1"}}},
      {mainMod, "mouse_up",   hl.dsp.focus,                    {{workspace = "e-1"}}},
      {mainMod, "mouse:272",  hl.dsp.window.drag,              {}, {mouse = true}},
      {mainMod, "mouse:273",  hl.dsp.window.resize,            {}, {mouse = true}},

      -- Media keys
      {noMod, "XF86AudioRaiseVolume",  hl.dsp.exec_cmd, {"wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"}, {locked = true, repeating = true}},
      {noMod, "XF86AudioLowerVolume",  hl.dsp.exec_cmd, {"wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"},      {locked = true, repeating = true}},
      {noMod, "XF86AudioMute",         hl.dsp.exec_cmd, {"wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"},     {locked = true, repeating = true}},
      {noMod, "XF86AudioMicMute",      hl.dsp.exec_cmd, {"wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"},   {locked = true, repeating = true}},
      {noMod, "XF86MonBrightnessUp",   hl.dsp.exec_cmd, {"brightnessctl -e4 -n2 set 5%+"},                  {locked = true, repeating = true}},
      {noMod, "XF86MonBrightnessDown", hl.dsp.exec_cmd, {"brightnessctl -e4 -n2 set 5%-"},                  {locked = true, repeating = true}},
      {noMod, "XF86AudioNext",         hl.dsp.exec_cmd, {"playerctl next"},                                 {locked = true}},
      {noMod, "XF86AudioPause",        hl.dsp.exec_cmd, {"playerctl play-pause"},                           {locked = true}},
      {noMod, "XF86AudioPlay",         hl.dsp.exec_cmd, {"playerctl play-pause"},                           {locked = true}},
      {noMod, "XF86AudioPrev",         hl.dsp.exec_cmd, {"playerctl previous"},                             {locked = true}}
  }

  local master_binds = {
      {mainMod, "J",      hl.dsp.layout, {"cyclenext"}},
      {mainMod, "K",      hl.dsp.layout, {"cycleprev"}},
      {sMod,    "J",      hl.dsp.layout, {"swapnext"}},
      {sMod,    "K",      hl.dsp.layout, {"swapprev"}},
      {mainMod, "L",      hl.dsp.layout, {"mfact +0.02"}},
      {mainMod, "H",      hl.dsp.layout, {"mfact -0.02"}},
      {mainMod, "Return", hl.dsp.layout, {"swapwithmaster"}},
  }

  function make_bindings(bind)
    for _, b in ipairs(bind) do
        local mod, key, func, args, opts = b[1], b[2], b[3], b[4], b[5]
        local combo = (mod == "") and key or (mod .. " + " .. key)
        local cmd = func(table.unpack(args))
        hl.bind(combo, cmd, opts or {})
    end
  end

  make_bindings(general_binds)
  make_bindings(master_binds)

  -- Switch workspaces with mainMod + [0-9]
  -- Move active window to a workspace with mainMod + SHIFT + [0-9]
  for i = 1, 10 do
      local key = i % 10 -- 10 maps to key 0
      hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
      hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
  end

  --------------------------------
  ---- WINDOWS AND WORKSPACES ----
  --------------------------------

  -- Example window rules that are useful
  local suppressMaximizeRule = hl.window_rule({
      -- Ignore maximize requests from all apps. You'll probably like this.
      name  = "suppress-maximize-events",
      match = { class = ".*" },

      suppress_event = "maximize",
  })
  -- suppressMaximizeRule:set_enabled(false)

  hl.window_rule({
      -- Fix some dragging issues with XWayland
      name  = "fix-xwayland-drags",
      match = {
          class      = "^$",
          title      = "^$",
          xwayland   = true,
          float      = true,
          fullscreen = false,
          pin        = false,
      },
      no_focus = true,
  })

  -- Hyprland-run windowrule
  hl.window_rule({
      name  = "move-hyprland-run",
      match = { class = "hyprland-run" },

      move  = "20 monitor_h-120",
      float = true,
  })
''
