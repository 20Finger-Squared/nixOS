{ pkgs }:
{
    plugin = pkgs.vimPlugins.nvim-treesitter.withAllGrammars; # Syntax Highlighting
    type = "lua";
    config = ''
        require('nvim-treesitter.configs').setup {
            highlight = { enable = true}
        }
    '';
}
