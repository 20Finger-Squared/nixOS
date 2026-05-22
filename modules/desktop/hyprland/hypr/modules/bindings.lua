config.general_binds = {
    {config.mainMod, "Tab",        hl.dsp.exec_cmd,                 {config.menu}},
    {config.sMod,    "C",          hl.dsp.window.close,             {}},
    {config.mainMod, "Space",      hl.dsp.exec_cmd,                 {config.terminal}},
    {config.mainMod, "M",          hl.dsp.exec_cmd,                 {"command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"}},
    {config.mainMod, "V",          hl.dsp.window.float,             {{action = "toggle"}}},
    {config.mainMod, "R",          hl.dsp.exec_cmd,                 {config.menu}},
    {config.mainMod, "S",          hl.dsp.workspace.toggle_special, {"magic"}},
    {config.sMod,    "S",          hl.dsp.window.move,              {{workspace = "special:magic"}}},
    {config.mainMod, "mouse_down", hl.dsp.focus,                    {{workspace = "e+1"}}},
    {config.mainMod, "mouse_up",   hl.dsp.focus,                    {{workspace = "e-1"}}},
    {config.mainMod, "mouse:272",  hl.dsp.window.drag,              {}, {mouse = true}},
    {config.mainMod, "mouse:273",  hl.dsp.window.resize,            {}, {mouse = true}},

    -- Media keys
    {config.noMod, "XF86AudioRaiseVolume",  hl.dsp.exec_cmd, {"wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"}, {locked = true, repeating = true}},
    {config.noMod, "XF86AudioLowerVolume",  hl.dsp.exec_cmd, {"wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"},      {locked = true, repeating = true}},
    {config.noMod, "XF86AudioMute",         hl.dsp.exec_cmd, {"wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"},     {locked = true, repeating = true}},
    {config.noMod, "XF86AudioMicMute",      hl.dsp.exec_cmd, {"wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"},   {locked = true, repeating = true}},
    {config.noMod, "XF86MonBrightnessUp",   hl.dsp.exec_cmd, {"brightnessctl -e4 -n2 set 5%+"},                  {locked = true, repeating = true}},
    {config.noMod, "XF86MonBrightnessDown", hl.dsp.exec_cmd, {"brightnessctl -e4 -n2 set 5%-"},                  {locked = true, repeating = true}},
    {config.noMod, "XF86AudioNext",         hl.dsp.exec_cmd, {"playerctl next"},                                 {locked = true}},
    {config.noMod, "XF86AudioPause",        hl.dsp.exec_cmd, {"playerctl play-pause"},                           {locked = true}},
    {config.noMod, "XF86AudioPlay",         hl.dsp.exec_cmd, {"playerctl play-pause"},                           {locked = true}},
    {config.noMod, "XF86AudioPrev",         hl.dsp.exec_cmd, {"playerctl previous"},                             {locked = true}}
}

config.master_binds = {
    {config.mainMod, "J",      hl.dsp.layout, {"cyclenext"}},
    {config.mainMod, "K",      hl.dsp.layout, {"cycleprev"}},
    {config.sMod,    "J",      hl.dsp.layout, {"swapnext"}},
    {config.sMod,    "K",      hl.dsp.layout, {"swapprev"}},
    {config.mainMod, "L",      hl.dsp.layout, {"mfact +0.02"}},
    {config.mainMod, "H",      hl.dsp.layout, {"mfact -0.02"}},
    {config.mainMod, "Return", hl.dsp.layout, {"swapwithmaster"}},
}

local M = {}
return M
