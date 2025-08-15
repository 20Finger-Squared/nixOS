{ pkgs }:
{
    plugin = pkgs.vimPlugins.nvim-web-devicons;
    type = "lua";
    config = ''
        require("nvim-web-devicons").setup{}
    '';
}
