local lspconfig = require("lspconfig")

lspconfig.clangd.setup({})

-- Standard LSP capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.clangd.setup({
  cmd = { "clangd", "--header-insertion=iwyu", "--clang-tidy" },
  init_options = {
    clangdOnSave = true,
    semanticHighlighting = true,
    fallbackFlags = {
      "-std=c99",
      "-Wall",
      "-Wextra",
      "-Wpedantic",
      "-Werror=implicit-function-declaration"
    }
  }
})

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
                command = { "nixfmt" }, -- or "alejandra" if you prefer
            },
            nix = {
                flake = {
                    autoEvalInputs = true,
                },
            },
        },
    },
})

local lspconfig = require('lspconfig')

lspconfig.intelephense.setup({
  on_attach = function(client, bufnr)
    -- Enable inlay hints if supported
    if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,

  settings = {
    intelephense = {
      -- PHP stubs for better completion
      stubs = {
        "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl",
        "date", "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm",
        "ftp", "gd", "gettext", "gmp", "hash", "iconv", "imap", "intl", "json", "ldap",
        "libxml", "mbstring", "meta", "mysqli", "oci8", "odbc", "openssl", "pcntl",
        "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql",
        "Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop",
        "SimpleXML", "snmp", "soap", "sockets", "sodium", "SPL", "sqlite3", "standard",
        "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy", "tokenizer", "xml",
        "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib"
      },

      files = {
        maxSize = 1000000, -- 1MB
        exclude = {
          "**/.git/**",
          "**/.svn/**",
          "**/.hg/**",
          "**/CVS/**",
          "**/.DS_Store/**",
          "**/node_modules/**",
          "**/bower_components/**",
          "**/vendor/**/{Tests,tests}/**",
        },
      },

      -- Enable all features
      diagnostics = {
        enable = true,
      },

      format = {
        enable = true,
      },
    },
  },
})
