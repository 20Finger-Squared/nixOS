{ pkgs }:
{
    plugin = pkgs.vimPlugins.gruvbox-nvim;
    type = "lua";
    config = ''
        require("gruvbox").setup({
                -- Configure gruvbox options here
                contrast = "", -- can be "hard", "soft" or empty string
                transparent_mode = true,
                })
        vim.cmd("colorscheme gruvbox")
    '';
}
