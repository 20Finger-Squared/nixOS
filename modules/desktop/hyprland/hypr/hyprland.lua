-- Your existing bootloader logic follows here...
config = {}
config.critical = { -- what variables are required to be initialise otherwise config will fail
    "mainMod", "sMod", "noMod", "terminal", "menu", "colourscheme"
}

require "modules.colourscheme" -- colour-scheme is required so the user can select one
require "main"

-- check for missing critical settings
local load_defaults=false
for _, var in ipairs(config.critical) do
    if config[var] == nil then
        local msg = "Configuration Error: '" .. var .. "' is not defined in main.lua! Using default setting!"
        -- Log to the terminal for debugging
        error(msg)

        if not config.disable_error_message then
          -- Native Hyprland notification
          -- 0 = error, 5000 = 5 seconds, "..." = message
          os.execute("hyprctl notify 0 5000 'rgb(ff0000)' '" .. msg .. "'&")
        end

        -- prevents total failure
        load_defaults=true
    end
end

-- load backup settings on failure
if load_defaults then
  require "defaults"
end

require "modules.config"
require "modules.bindings"
require "modules.animations"
require "modules.smart-gaps"
require "modules.double-borders"
require "modules.cursor"
require "backend"
