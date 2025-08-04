{ config, pkgs, ... }:
{
	home.stateVersion = "25.05";

# Font configuration
	fonts.fontconfig.enable = true;
	home.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
	];

# Git configuration
	programs.git = {
		enable = true;
		userName = "Rhylie";
		userEmail = "your-email@example.com"; # Change this
	};

# Kitty terminal with Gruvbox theme and JetBrains Mono NF
	programs.kitty = {
		enable = true;
		settings = {
# Gruvbox colors
			background = "#282828";
			foreground = "#ebdbb2";

# Normal colors
			color0 = "#282828";  # black
				color1 = "#cc241d";  # red
				color2 = "#98971a";  # green
				color3 = "#d79921";  # yellow
				color4 = "#458588";  # blue
				color5 = "#b16286";  # magenta
				color6 = "#689d6a";  # cyan
				color7 = "#a89984";  # white

# Bright colors
				color8 = "#928374";   # bright black
				color9 = "#fb4934";   # bright red
				color10 = "#b8bb26";  # bright green
				color11 = "#fabd2f";  # bright yellow
				color12 = "#83a598";  # bright blue
				color13 = "#d3869b";  # bright magenta
				color14 = "#8ec07c";  # bright cyan
				color15 = "#ebdbb2";  # bright white

# Font configuration
				font_family = "JetBrainsMono Nerd Font";
			bold_font = "JetBrainsMono Nerd Font Bold";
			italic_font = "JetBrainsMono Nerd Font Italic";
			bold_italic_font = "JetBrainsMono Nerd Font Bold Italic";
			font_size = 14;

# Window padding
			window_padding_width = 10;
		};
	};

# Zsh configuration
	programs.zsh = {
		enable = true;
		shellAliases = {
			wkeys = "wshowkeys -b '#282828' -f '#ebdbb2' -s '#458588' -t 1000 -a bottom";
			ll = "ls -la";
			la = "ls -la";
			rebuild = "sudo nixos-rebuild switch";
		};
	};

	programs.neovim = {
		enable = true;
		defaultEditor = true;
		plugins = with pkgs.vimPlugins; [
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
		{
			plugin = telescope-nvim;
			type = "lua";
			config = ''
				local builtin = require('telescope.builtin')
				vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
				vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
				vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
				vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
				vim.keymap.set('n', '<leader>fo', builtin.vim_options, {})
				vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
				require("telescope").setup{}
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
		extraLuaConfig = ''
			vim.g.mapleader = " "
			vim.g.maplocalleader = " "

			-- General
			vim.opt.wrap = false
			vim.opt.lazyredraw = true
			vim.opt.number = true
			vim.opt.relativenumber = true
			vim.opt.cursorline = true
			vim.opt.spell = true

			-- Tabs
			vim.opt.tabstop = 4
			vim.opt.shiftwidth = 4
			vim.opt.smarttab = false
			vim.opt.expandtab = true
			vim.opt.smartindent = true

			-- Swap file
			vim.opt.swapfile = false

			vim.opt.termguicolors = true
			vim.opt.showmode = false
			vim.opt.laststatus = 3

			-- Search
			vim.opt.smartcase = true
			vim.opt.incsearch = true
			vim.opt.hlsearch = true

			-- Backup & undo
			vim.opt.backup = false
			vim.opt.writebackup = false
			vim.opt.undofile = true

			-- Scrolling & wrapping
			vim.opt.scrolloff = 4
			vim.opt.sidescrolloff = 4
			vim.opt.linebreak = true

			-- Performance
			vim.opt.updatetime = 300
			vim.opt.timeoutlen = 500
			'';
		extraPackages = with pkgs; [
			ripgrep # Requirement for telescope
		];
	};
}
