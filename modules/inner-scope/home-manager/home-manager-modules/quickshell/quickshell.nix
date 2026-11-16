{ mkConfig, inputs, pkgs, colourscheme, ... }@module-args:
mkConfig.home.software "quickshell" module-args
{
    home.packages = [
      pkgs.qt5.qtsvg
      pkgs.qt5.qtimageformats
      pkgs.qt5.qtmultimedia
    ];

    programs.quickshell = {
      enable = true;
      systemd.enable = true;
      package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;
      configs.default =
      let
        colourscheme-file = pkgs.writeText "Colours.qml" /* qml */''
        pragma Singleton
        import QtQuick

        QtObject {
        readonly property color bg:             "${ colourscheme.bg }"
        readonly property color fg:             "${ colourscheme.fg }"
        readonly property color black:          "${ colourscheme.black }"
        readonly property color darkestGray:   "${ colourscheme.darkest-gray }"
        readonly property color darkGray:      "${ colourscheme.dark-gray }"
        readonly property color gray:           "${ colourscheme.gray }"
        readonly property color lightGray:     "${ colourscheme.light-gray }"
        readonly property color white:          "${ colourscheme.white }"
        readonly property color lighterWhite:  "${ colourscheme.lighter-white }"
        readonly property color brightWhite:   "${ colourscheme.bright-white }"
        readonly property color red:            "${ colourscheme.red }"
        readonly property color orange:         "${ colourscheme.orange }"
        readonly property color yellow:         "${ colourscheme.yellow }"
        readonly property color green:          "${ colourscheme.green }"
        readonly property color cyan:           "${ colourscheme.cyan }"
        readonly property color blue:           "${ colourscheme.blue }"
        readonly property color magenta:        "${ colourscheme.magenta }"
        readonly property color brown:          "${ colourscheme.brown }"
        readonly property color brightRed:     "${ colourscheme.bright-red }"
        readonly property color brightYellow:  "${ colourscheme.bright-yellow }"
        readonly property color brightGreen:   "${ colourscheme.bright-green }"
        readonly property color brightCyan:    "${ colourscheme.bright-cyan }"
        readonly property color brightBlue:    "${ colourscheme.bright-blue }"
        readonly property color brightMagenta: "${ colourscheme.bright-magenta }"

        readonly property color base00:        "${colourscheme.base00}"
        readonly property color base01:        "${colourscheme.base01}"
        readonly property color base02:        "${colourscheme.base02}"
        readonly property color base03:        "${colourscheme.base03}"
        readonly property color base04:        "${colourscheme.base04}"
        readonly property color base05:        "${colourscheme.base05}"
        readonly property color base06:        "${colourscheme.base06}"
        readonly property color base07:        "${colourscheme.base07}"
        readonly property color base08:        "${colourscheme.base08}"
        readonly property color base09:        "${colourscheme.base09}"
        readonly property color base0A:        "${colourscheme.base0A}"
        readonly property color base0B:        "${colourscheme.base0B}"
        readonly property color base0C:        "${colourscheme.base0C}"
        readonly property color base0D:        "${colourscheme.base0D}"
        readonly property color base0E:        "${colourscheme.base0E}"
        readonly property color base0F:        "${colourscheme.base0F}"
        readonly property color base10:        "${colourscheme.base10}"
        readonly property color base11:        "${colourscheme.base11}"
        readonly property color base12:        "${colourscheme.base12}"
        readonly property color base13:        "${colourscheme.base13}"
        readonly property color base14:        "${colourscheme.base14}"
        readonly property color base15:        "${colourscheme.base15}"
        readonly property color base16:        "${colourscheme.base16}"
        }
        '';
        quickshellConfig = pkgs.runCommand "quickshell-config" {} ''
          mkdir -p $out
          cp -r ${inputs.self.outputs.quickshell-config.default}/* $out/
          cp ${colourscheme-file} $out/Colours.qml
        '';
      in
      quickshellConfig;
    };
}
