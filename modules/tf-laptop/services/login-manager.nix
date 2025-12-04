{ pkgs, ... }:
{
  services = {
    displayManager = {
      enable = true;
      ly = {
        enable = true; # Ly a simple login screen
        package = pkgs.ly;
        settings = {
          allow_empty_password = false;
          animation = "doom";
          auth_fails = 1;
          box_title = "Best place to login";
          clear_password = true;
          clock = "%x";
        };
      };
    };
  };
}
