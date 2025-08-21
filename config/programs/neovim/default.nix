{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = [

      # deps
      pkgs.vimPlugins.plenary-nvim
      pkgs.vimPlugins.nvim-web-devicons
      pkgs.vimPlugins.luasnip

      # plugins
      pkgs.vimPlugins.render-markdown-nvim
      pkgs.vimPlugins.mini-ai
      pkgs.vimPlugins.mini-align
      pkgs.vimPlugins.mini-surround
      (import ./plugins/treesitter.nix { inherit pkgs; })
      (import ./plugins/cmp.nix { inherit pkgs; })
      (import ./plugins/git-signs.nix { inherit pkgs; })
      (import ./plugins/gruvbox.nix { inherit pkgs; })
      (import ./plugins/lsp-conf.nix { inherit pkgs; })
      (import ./plugins/mini-statusline.nix { inherit pkgs; })
      (import ./plugins/telescope.nix { inherit pkgs; })
      (import ./plugins/oil.nix { inherit pkgs; })
    ];

    extraLuaConfig = builtins.concatStringsSep "\n" [
      (import ./opts.nix { inherit pkgs; })
      (import ./lsp.nix { inherit pkgs; })
      (import ./autocmds.nix { inherit pkgs; })
      (import ./keymaps.nix { inherit pkgs; })
    ];
  };
}
