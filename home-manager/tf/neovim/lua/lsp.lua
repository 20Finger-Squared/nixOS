vim.lsp.config("nixd", {
    cmd = { "nixd" },
    filetypes = { "nix" },
    root_markers = { "flake.nix", "default.nix" },

    settings = {
        nixd = {
            nixpkgs = {
                expr = 'import (builtins.getFlake ("~/nixOS")).inputs.nixpkgs { }',
            },

            options = {
                nixos = {
                    expr = '(builtins.getFlake ("~/nixOS")).nixosConfigurations."tf-nixos".options',
                },

                home_manager = {
                    expr = '(builtins.getFlake ("~/nixOS")).nixosConfigurations."tf-nixos".options.home-manager.users.type.getSubOptions []',
                },
            },
        },
    },
})

vim.lsp.enable("nixd")
