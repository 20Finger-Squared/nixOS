local lspconfig = require("lspconfig")

lspconfig.clangd.setup({})

-- Standard LSP capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.marksman.setup({
    cmd = { "marksman", "server" },
    filetypes = { "markdown" },
    root_dir = lspconfig.util.root_pattern(".git", "."),
    settings = {},
})

-- HTML LSP
lspconfig.html.setup({
    capabilities = capabilities,
    settings = {
	html = {
	    format = {
		templating = true,
		wrapLineLength = 120,
		wrapAttributes = 'auto',
	    },
	    hover = {
		documentation = true,
		references = true,
	    },
	},
    },
})

-- CSS LSP
lspconfig.cssls.setup({
    capabilities = capabilities,
    settings = {
	css = { validate = true },
    },
})

-- Yuck LSP setup
lspconfig.yuck_ls.setup({
    default_config = {
	cmd = { "yuckls" },
	filetypes = { "yuck" },
    }
})

-- TypeScript / JavaScript LSP
lspconfig.ts_ls.setup({
    name = "ts_ls", -- optional alias
    capabilities = capabilities,
    settings = {
	javascript = { format = { semicolons = 'insert' } },
	typescript = { format = { semicolons = 'insert' } },
    },
})

-- Changed from pyright to basedpyright
lspconfig.basedpyright.setup({
    settings = {
	basedpyright = {
	    analysis = {
		inlayHints = {
		    variableTypes = true,
		    callArgumentNames = true
		},
		diagnosticMode = "openFilesOnly" -- Fixed typo: "diagnositcMode"
	    }
	}
    }
})

lspconfig.lua_ls.setup({
    settings = {
	Lua = {
	    runtime = { version = 'LuaJIT' },
	    diagnostics = { globals = { 'vim' } },
	    workspace = {
		library = vim.api.nvim_get_runtime_file("", true),
		checkThirdParty = false,
	    },
	    telemetry = { enable = false },
	    format = {
		enable = true,
		defaultConfig = {
		    indent_style = "space",
		    indent_size = "2",
		    max_width = "80",
		}
	    }
	},
    },
})

-- Nil LSP (for Nix language)
lspconfig.nil_ls.setup({
    cmd = { "nil" }, -- or "nil-lsp" depending on your system package
    filetypes = { "nix" },
    root_dir = lspconfig.util.root_pattern(".git", "flake.nix", "default.nix", "shell.nix"),
    capabilities = capabilities,
    settings = {
        ['nil'] = {
            formatting = {
                command = { "nixpkgs-fmt" }, -- or "alejandra" if you prefer
            },
            nix = {
                flake = {
                    autoEvalInputs = true,
                },
            },
        },
    },
})
