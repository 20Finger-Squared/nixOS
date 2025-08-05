{ config, pkgs, ... }:

{
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
				vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
				vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
				vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
				vim.keymap.set('n', '<leader>to', builtin.vim_options, {})
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

