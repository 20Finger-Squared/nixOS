{ colorscheme }:
/* toml */ ''
  "$schema" = 'https://starship.rs/config-schema.json'

  format = """
  $directory(fg:color_orange)\
  $character
  """

  right_format = """
  [](fg:color_bg1)\
  $docker_context\
  $conda\
  $pixi\
  $nix_shell\
  [](fg:color_aqua bg:color_bg1)\
  $git_branch\
  $git_status\
  $c\
  $cpp\
  $rust\
  $golang\
  $nodejs\
  $php\
  $java\
  $kotlin\
  $haskell\
  $python\
  """

  palette = 'gruvbox_dark'

  [palettes.gruvbox_dark]
  color_fg0 = '#${colorscheme.base07}'
  color_bg1 = '#${colorscheme.base01}'
  color_bg3 = '#${colorscheme.base03}'
  color_blue = '#${colorscheme.base0D}'
  color_aqua = '#${colorscheme.base0C}'
  color_green = '#${colorscheme.base0B}'
  color_orange = '#${colorscheme.base09}'
  color_purple = '#${colorscheme.base0E}'
  color_red = '#${colorscheme.base08}'
  color_yellow = '#${colorscheme.base0A}'

  [os]
  disabled = false
  style = "bg:color_orange fg:color_fg0"

  [os.symbols]
  Nix = "󱄅 "

  [nix_shell]
  disabled = false
  impure_msg = '[impure shell](bold fg:color_red bg:color_bg1)'
  pure_msg = '[pure shell](bold fg:color_green bg:color_bg1)'
  unknown_msg = '[unknown shell](bold fg:color_yellow bg:color_bg1)'
  format = '[[ ☃️ $state( \($name\)) ](fg:color_fg0 bg:color_bg1)]($style)'
  style = "bg:color_bg1 fg:color_fg0"

  [directory]
  style = "fg:color_yellow"
  format = "[ $path ]($style)"
  truncation_length = 20
  truncation_symbol = "…/"

  [directory.substitutions]
  "Documents" = "󰈙 "
  "Downloads" = " "
  "Music" = "󰝚 "
  "Pictures" = " "
  "Developer" = "󰲋 "
  "projects" = "󱂬 "

  [git_branch]
  symbol = ""
  style = "bg:color_aqua"
  format = '[[ $symbol $branch ](fg:color_fg0 bg:color_aqua)]($style)'

  [git_status]
  style = "bg:color_aqua"
  format = '[[($all_status$ahead_behind )](fg:color_fg0 bg:color_aqua)]($style)'

  [c]
  symbol = " "
  style = "bg:color_blue"
  format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

  [cpp]
  symbol = " "
  style = "bg:color_blue"
  format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

  [rust]
  symbol = ""
  style = "bg:color_blue"
  format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

  [golang]
  symbol = ""
  style = "bg:color_blue"
  format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

  [php]
  symbol = ""
  style = "bg:color_blue"
  format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

  [java]
  symbol = ""
  style = "bg:color_blue"
  format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

  [kotlin]
  symbol = ""
  style = "bg:color_blue"
  format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

  [haskell]
  symbol = ""
  style = "bg:color_blue"
  format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

  [python]
  symbol = ""
  style = "bg:color_blue"
  format = '[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)'

  [docker_context]
  symbol = ""
  style = "bg:color_bg3"
  format = '[[ $symbol( $context) ](fg:#83a598 bg:color_bg3)]($style)'

  [pixi]
  style = "bg:color_bg3"
  format = '[[ $symbol( $version)( $environment) ](fg:color_fg0 bg:color_bg3)]($style)'

  [line_break]
  disabled = false

  [character]
  disabled = false
  success_symbol = '[](bold fg:color_yellow)'
  error_symbol = '[](bold fg:color_red)'
  vimcmd_symbol = '[](bold fg:color_green)'
  vimcmd_replace_one_symbol = '[](bold fg:color_purple)'
  vimcmd_replace_symbol = '[](bold fg:color_purple)'
  vimcmd_visual_symbol = '[](bold fg:color_yellow)'
''
