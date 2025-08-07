{ config, pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		plugins = with pkgs.vimPlugins; [
           (import ./plugins/mini.nix { inherit pkgs; })
           (import ./plugins/git-signs.nix { inherit pkgs; })
           (import ./plugins/telescope.nix { inherit pkgs; })
           (import ./plugins/lsp-conf.nix { inherit pkgs; })
           (import ./plugins/cmp.nix { inherit pkgs; })
		{
			plugin = nvim-treesitter.withAllGrammars; # Syntax Highlighting
			type = "lua";
			config = ''
				require('nvim-treesitter.configs').setup {
					highlight = { enable = true}
				}
			'';
		}
		{
			plugin = nvim-web-devicons;
			type = "lua";
			config = ''
				require("nvim-web-devicons").setup{}
			'';
		}
		plenary-nvim
		{
			plugin = gruvbox-nvim;
			type = "lua";
			config = ''
				require("gruvbox").setup({
						-- Configure gruvbox options here
						contrast = "", -- can be "hard", "soft" or empty string
						transparent_mode = false,
						})
				vim.cmd("colorscheme gruvbox")
				'';
		}
        ];
        extraLuaConfig = builtins.concatStringsSep "\n" [
            (import ./opts.nix { inherit pkgs; })
            (import ./lsp.nix { inherit pkgs; })
        ];
    };
}

