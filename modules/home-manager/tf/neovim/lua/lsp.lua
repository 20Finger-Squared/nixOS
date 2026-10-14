vim.lsp.config("nixd", {
    cmd = { "nixd" },
    filetypes = { "nix" },
    root_markers = { "flake.nix", "default.nix" },

    settings = {
        nixd = {
            nixpkgs = {
                expr = 'import (builtins.getFlake "/home/tf/nixOS").inputs.nixpkgs { }',
            },
        },
    },
})

vim.lsp.enable("nixd")

vim.lsp.config("clangd", {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_markers = {
        ".clangd",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac",
        ".git",
    },
})

vim.lsp.enable("clangd")
