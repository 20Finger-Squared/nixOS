{ inputs, pkgs, ... }:

let
addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
    programs.firefox = {
        enable = true;

        policies = {
            ExtensionSettings = {
                "*" = {
                    installation_mode = "allowed";   # allows user to enable extensions
                        default_area = "navbar";         # optional: makes icon visible
                        private_browsing = true;         # optional: enable in private windows
                };
            };
        };

        profiles.tf = {
            search.default = "ddg";
            isDefault = true;
            extensions.packages = with addons; [
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
    };
}
