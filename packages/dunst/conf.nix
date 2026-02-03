{ colorscheme }:
# yaml
''
  [global]
    timeout = 3
    notification_limit = 20
    frame_width = 3
    font="JetbrainMono NF 10"
    corner_radius = 15
    padding=8
    horizontal_padding=8

    separator_color = "#${colorscheme.base01}"
  [rules]
    [all]
        background = "#${colorscheme.base00}"
        foreground = "#${colorscheme.base07}"
        frame_color = "#${colorscheme.base01}"
        highlight = "#${colorscheme.base0A}"

    [summary="Volume"]
        background = "#${colorscheme.base00}"
        foreground = "#${colorscheme.base07}"
        frame_color = "#${colorscheme.base01}"
        highlight = "#${colorscheme.base0A}"
        stack_tag = "volume"
        timeout = 1  # Short timeout since you're adjusting quickly
''
