{ config, lib, ... }:
let
  cfg = config.programs.dwm.tagKeys.modifiers;
in
# c
''
  {{ ${cfg.viewOnlyThisTag}, 0, 0, 0 },       {KEY, 0, 0, 0 }, view,       {.ui = 1 << TAG} }, \
  {{ ${cfg.toggleThisTagInView}, 0, 0, 0 },   {KEY, 0, 0, 0 }, toggleview, {.ui = 1 << TAG} }, \
  {{ ${cfg.moveWindowToThisTag}, 0, 0, 0 },   {KEY, 0, 0, 0 }, tag,        {.ui = 1 << TAG} }, \
  {{ ${cfg.toggleWindowOnThisTag}, 0, 0, 0 }, {KEY, 0, 0, 0 }, toggletag,  {.ui = 1 << TAG} },
''
