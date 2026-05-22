local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config('clangd', {
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
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
vim.lsp.enable('clangd')

vim.lsp.config('marksman', {
  cmd = { "marksman", "server" },
  filetypes = { "markdown" },
  root_dir = function(bufnr)
    return vim.fs.root(bufnr, { ".git", "." })
  end,
  settings = {},
})
vim.lsp.enable('marksman')

vim.lsp.config('html', {
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
vim.lsp.enable('html')

vim.lsp.config('cssls', {
  capabilities = capabilities,
  settings = {
    css = { validate = true },
  },
})
vim.lsp.enable('cssls')

vim.lsp.config('yuck_ls', {
  default_config = {
    cmd = { "yuckls" },
    filetypes = { "yuck" },
  }
})
vim.lsp.enable('yuck_ls')

vim.lsp.config('ts_ls', {
  name = "ts_ls",
  capabilities = capabilities,
  settings = {
    javascript = { format = { semicolons = 'insert' } },
    typescript = { format = { semicolons = 'insert' } },
  },
})
vim.lsp.enable('ts_ls')

vim.lsp.config('basedpyright', {
  settings = {
    basedpyright = {
      analysis = {
        inlayHints = {
          variableTypes = true,
          callArgumentNames = true
        },
        diagnosticMode = "openFilesOnly"
      }
    }
  }
})
vim.lsp.enable('basedpyright')

vim.lsp.config('lua_ls', {
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
vim.lsp.enable('lua_ls')

vim.lsp.config('nixd', {
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import (builtins.getFlake \"/home/tf/nixOS\").inputs.nixpkgs { overlays = [ ]; }",
      },
      options = {
        nixos = {
          expr = "(builtins.getFlake \"/home/tf/nixOS\").nixosConfigurations.pc.options",
        },
      },
    },
  },
})
vim.lsp.enable('nixd')

vim.lsp.config('nil_ls', {
  cmd = { "nil" },
  filetypes = { "nix" },
  root_dir = function(bufnr)
    return vim.fs.root(bufnr, { ".git", "flake.nix", "default.nix", "shell.nix" })
  end,
  capabilities = capabilities,
  settings = {
    ['nil'] = {
      formatting = {
        command = { "nixfmt" },
      },
      nix = {
        flake = {
          autoEvalInputs = true,
        },
      },
    },
  },
})
vim.lsp.enable('nil_ls')

vim.lsp.config('intelephense', {
  settings = {
    intelephense = {
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
        maxSize = 1000000,
        exclude = {
          "**/.git/**", "**/.svn/**", "**/.hg/**", "**/CVS/**", "**/.DS_Store/**",
          "**/node_modules/**", "**/bower_components/**", "**/vendor/**/{Tests,tests}/**",
        },
      },
      diagnostics = { enable = true },
      format = { enable = true },
    },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or client.name ~= "intelephense" then return end

    local bufnr = args.buf

    -- Handle Inlay Hints
    if client.supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    -- Proper formatting autocmd
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
})

vim.lsp.enable('intelephense')
