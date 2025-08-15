{ pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		plugins = with pkgs.vimPlugins; [

           (import ./plugins/cmp.nix               { inherit pkgs; })
           (import ./plugins/git-signs.nix         { inherit pkgs; })
           (import ./plugins/gruvbox.nix           { inherit pkgs; })
           (import ./plugins/lsp-conf.nix          { inherit pkgs; })
           (import ./plugins/luasnips.nix          { inherit pkgs; })
           (import ./plugins/mini.nix              { inherit pkgs; })
           (import ./plugins/nvim-web-devicons.nix { inherit pkgs; })
           (import ./plugins/telescope.nix         { inherit pkgs; })
           (import ./plugins/treewalker.nix        { inherit pkgs; })
           (import ./plugins/treesitter.nix        { inherit pkgs; })

		   plenary-nvim # too small to need it's own file. It's a requirement for telescope
        ];

        extraLuaConfig = builtins.concatStringsSep "\n" [
            (import ./opts.nix { inherit pkgs; })
            (import ./keymaps.nix { inherit pkgs; })
        ];
    };
}

