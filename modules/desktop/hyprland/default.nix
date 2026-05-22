{
  lib,
  pkgs,
  ...
}@inputs:
let
  pluginHook = pkgs.writeText "plugin-hook.lua" ''
    hl.on("hyprland.start", function()
      hl.exec_cmd("hyprctl plugin load ${pkgs.hyprlandPlugins.borders-plus-plus}/lib/libborders-plus-plus.so")
    end)

  '';

  hyprConfigDir = pkgs.runCommand "hyprland-config" { } ''
    mkdir -p $out
    cp -a ${./hypr}/. $out/
    chmod -R u+w $out

    # Prepend the hook safely
    cat ${pluginHook} $out/hyprland.lua > $out/combined.lua
    mv $out/combined.lua $out/hyprland.lua
  '';
in
lib.mkDesktopOption "hyprland" inputs {
  programs.hyprland.enable = true;

  environment.systemPackages = [
    pkgs.hyprlauncher
    pkgs.hyprpaper
    pkgs.hyprlandPlugins.borders-plus-plus
  ];

  system.userActivationScripts.hyprland-config = {
    text = ''
      # Hardcode your real user directory to bypass root $HOME issues
      TARGET_DIR="/home/tf/.config/hypr"

      mkdir -p "/home/tf/.config"
      rm -rf "$TARGET_DIR"
      ln -sfn "${hyprConfigDir}" "$TARGET_DIR"

      # Fix ownership just in case root created the parent dirs
      chown -R tf:users "/home/tf/.config" || true
    '';
  };
}
