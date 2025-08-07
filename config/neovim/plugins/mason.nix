{ pkgs }:
{
    plugin = pkgs.vimPlugins.mason-nvim;
    type = "lua";
    config = ''
        require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                }
            }
        })
    '';
}
