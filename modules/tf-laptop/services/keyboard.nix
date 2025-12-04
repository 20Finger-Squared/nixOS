{ ... }:
{
  services = {
    kanata = {
      enable = true;
      keyboards.main = {
        # this defines the actual Katana (Kanata) config
        config = ''
          (defsrc caps)
          (deflayer base
            esc
          )
        '';
      };
    };
  };
}
