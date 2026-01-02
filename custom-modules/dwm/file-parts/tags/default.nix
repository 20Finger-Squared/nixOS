{ lib, config, ... }:
let
  cfg = config.programs.dwm.tagKeys.modifiers;
in
/* c */ ''
  {${cfg.viewOnlyThisTag},       KEY, view,       {.ui = 1 << TAG} }, \
  {${cfg.toggleThisTagInView},   KEY, toggleview, {.ui = 1 << TAG} }, \
  {${cfg.moveWindowToThisTag},   KEY, tag,        {.ui = 1 << TAG} }, \
  {${cfg.toggleWindowOnThisTag}, KEY, toggletag,  {.ui = 1 << TAG} },
''
