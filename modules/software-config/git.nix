{
  config,
  lib,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
in
{
  options.software-config.git.enable = mkEnableOption "my git config";
  config = mkIf config.software-config.git.enable {
    programs.git = {
      enable = true;
      config = {
        core = {
          editor = "nvim";

          autoclf = "input";
        };
        user = {
          name = "Rhylie M. Orton";
          email = "orhylie+git@gmail.com";
        };
        help.autocorrect = 1;
      };
    };
  };
}
