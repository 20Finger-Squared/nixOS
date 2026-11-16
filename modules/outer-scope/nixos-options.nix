{lib,...}:
let
  types = lib.types;
in
{
      /*
      This defines two options to be used in the outer-scope:
      `flake:
        Provides a namespace for setting flake outputs.
        i.e., it's basically just outputs

      nixos:
        An example is easier to understand.
        it's how you configure hosts.
        I prefer to err on the side of caution, so hardware and modules-config are separate.
        They could be the same, but keeping them separate serves as a useful reminder.
        ```nix
        nixos.* = {
          hardware = {...};
          modules-config = {...};
        };
        ```

      Look within
      ```sh
            ./hosts/pc/hardware.nix
            ./hosts/pc/default.nix
      ```
      to see full usage example. ( In Vim/Neovim, you can use `gf` to follow a file path )
      */
    options = {
      nixos = lib.mkOption {
        type = types.attrsOf (types.submodule {
          options = {
            modules-config = lib.mkOption { type=types.deferredModule; };
            hardware = lib.mkOption { type=types.deferredModule; };
          };
        });
        default = {};
      };

      flake = lib.mkOption {
        type = types.lazyAttrsOf types.raw;
        default = {};
      };
    };
}
