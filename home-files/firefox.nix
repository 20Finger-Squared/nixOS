{ pkgs, ... }@inputs:

let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
    programs.firefox = {
            enable = true;
            programs.firefox.profiles.tf.extensions.packages = with addons; [
                vimium-c
                gruvbox-dark-theme
                ublock-origin
                tree-style-tab
                clearurls
                private-relay
                privacy-badger
                consent-o-matic
            ];
        };
}
