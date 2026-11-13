{
  config,
  lib,
  ...
}:
{
  options.system-config.garbage-collection = {
    nh = lib.mkEnableOption "My config for nix helper garbage-collection.";
    native = lib.mkEnableOption "My config for native nix garbage-collection.";
  };

  config = {
    programs.nh.clean = lib.mkIf config.system-config.garbage-collection.nh {
      enable = true;
      extraArgs = "--keep 10 --keep-since 7d";
    };

    nix.gc = lib.mkIf config.system-config.garbage-collection.native {
      automatic = true;
      options = "--delete-older-than 30d";
    };

    warnings = (
      (lib.optionals (
        config.system-config.garbage-collection.nh && config.system-config.garbage-collection.native
      ) "You have enabled both native and nix-helper garbage collection disable one.")
      ++ (lib.optionals (
        !config.system-config.garbage-collection.nh && !config.system-config.garbage-collection.native
      ) "You have no garbage collectors enabled, it is best to enable at least one.")
    );
  };
}
