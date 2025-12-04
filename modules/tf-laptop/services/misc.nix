{ ... }:
{
  services = {
    printing.enable = true;
    fstrim.enable = true;
    openssh.settings.PermitRootLogin = "no";
  };
}
