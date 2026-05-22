function generate_bindings(bind)
  for _, b in ipairs(bind) do
      local mod, key, func, args, opts = b[1], b[2], b[3], b[4], b[5]
      local combo = (mod == "") and key or (mod .. " + " .. key)
      local cmd = func(table.unpack(args))
      hl.bind(combo, cmd, opts or {})
  end
end

generate_bindings(config.general_binds)
generate_bindings(config.master_binds)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(config.mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(config.mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end
--
-- Example window rules that are useful
hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
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

local M = {}
return M
