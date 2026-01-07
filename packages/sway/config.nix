{ pkgs, ... }:
''
  font pango:JetbrainsMono NF 9.000000
  floating_modifier Mod4
  default_border normal 3
  default_floating_border normal 3
  hide_edge_borders smart
  focus_wrapping workspace
  focus_follows_mouse yes
  focus_on_window_activation none
  mouse_warping output
  workspace_layout default
  workspace_auto_back_and_forth no
  client.focused #D79921 #FABD2F #1D2021 #83A598 #D79921
  client.focused_inactive #333333 #5f676a #ffffff #484e50 #5f676a
  client.unfocused #A89984 #3C3836 #A89984 #458588 #504945
  client.urgent #FB4934 #CC241D #FBF1C7 #FE8019 #504945
  client.placeholder #000000 #0c0c0c #ffffff #000000 #0c0c0c
  client.background #3C3836

  bindsym Mod4+0 workspace number 10
  bindsym Mod4+1 workspace number 1
  bindsym Mod4+2 workspace number 2
  bindsym Mod4+3 workspace number 3
  bindsym Mod4+4 workspace number 4
  bindsym Mod4+5 workspace number 5
  bindsym Mod4+6 workspace number 6
  bindsym Mod4+7 workspace number 7
  bindsym Mod4+8 workspace number 8
  bindsym Mod4+9 workspace number 9
  bindsym Mod4+Shift+0 move container to workspace number 10
  bindsym Mod4+Shift+1 move container to workspace number 1
  bindsym Mod4+Shift+2 move container to workspace number 2
  bindsym Mod4+Shift+3 move container to workspace number 3
  bindsym Mod4+Shift+4 move container to workspace number 4
  bindsym Mod4+Shift+5 move container to workspace number 5
  bindsym Mod4+Shift+6 move container to workspace number 6
  bindsym Mod4+Shift+7 move container to workspace number 7
  bindsym Mod4+Shift+8 move container to workspace number 8
  bindsym Mod4+Shift+9 move container to workspace number 9
  bindsym Mod4+Shift+Return exec swaylock -f -c 000000
  bindsym Mod4+Shift+c reload
  bindsym Mod4+Shift+e exec swaynag -t warning -m 'Exit Sway?' -B 'Exit' 'swaymsg exit'
  bindsym Mod4+Shift+h move left
  bindsym Mod4+Shift+j move down
  bindsym Mod4+Shift+k move up
  bindsym Mod4+Shift+l move right
  bindsym Mod4+Shift+minus move scratchpad
  bindsym Mod4+Shift+p exec poweroff
  bindsym Mod4+Shift+space floating toggle
  bindsym Mod4+Shift+t exec firefox
  bindsym Mod4+a focus parent
  bindsym Mod4+d exec fuzzel
  bindsym Mod4+e exec thunar
  bindsym Mod4+f fullscreen toggle
  bindsym Mod4+h focus left
  bindsym Mod4+j focus down
  bindsym Mod4+k focus up
  bindsym Mod4+l focus right
  bindsym Mod4+minus scratchpad show
  bindsym Mod4+q kill
  bindsym Mod4+r mode resize
  bindsym Mod4+s layout stacking
  bindsym Mod4+space focus mode_toggle
  bindsym Mod4+t exec ${pkgs.kitty}/bin/sh
  bindsym Mod4+w layout tabbed
  bindsym Mod4+y layout toggle split
  bindsym Print exec grim
  bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
  bindsym XF86AudioMicMute exec pactl set-source-mute @DEFAULT_SOURCE@ toggle
  bindsym XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle
  bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
  bindsym XF86MonBrightnessDown exec brightnessctl set 5%-
  bindsym XF86MonBrightnessUp exec brightnessctl set 5%+

  input "0:0:OpenTabletDriver_Virtual_Artist_Tablet" {
    map_to_output HDMI-A-1
  }

  input "type:keyboard" {
    xkb_layout gb
    xkb_options caps:escape
  }

  output "DP-1" {
    position 3440,0
  }

  output "HDMI-A-1" {
    position 0,0
  }

  mode "resize" {
    bindsym Down resize grow height 10 px
    bindsym Escape mode default
    bindsym Left resize shrink width 10 px
    bindsym Return mode default
    bindsym Right resize grow width 10 px
    bindsym Up resize shrink height 10 px
    bindsym h resize grow width 10 px
    bindsym j resize grow height 10 px
    bindsym k resize shrink height 10 px
    bindsym l resize shrink width 10 px
  }

  bar {
    font pango:monospace 8.000000
    mode dock
    hidden_state hide
    position bottom
    workspace_buttons yes
    strip_workspace_numbers no
    tray_output primary
    colors {
      background #000000
      statusline #ffffff
      separator #666666
      focused_workspace #4c7899 #285577 #ffffff
      active_workspace #333333 #5f676a #ffffff
      inactive_workspace #333333 #222222 #888888
      urgent_workspace #2f343a #900000 #ffffff
      binding_mode #2f343a #900000 #ffffff
    }
  }

  gaps outer 2
  gaps horizontal 3
  smart_gaps on
  smart_borders on
  exec "${pkgs.dbus}/bin/dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP XDG_SESSION_TYPE NIXOS_OZONE_WL XCURSOR_THEME XCURSOR_SIZE; systemctl --user reset-failed && systemctl --user start sway-session.target && swaymsg -mt subscribe '[]' || true && systemctl --user stop sway-session.target"
''
