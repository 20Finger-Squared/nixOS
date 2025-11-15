{ ... }:
{
  pam.services.swaylock = { }; # enables sway lock to use pam
  rtkit.enable = true;
  sudo.wheelNeedsPassword = true;
  apparmor.enable = true;
  auditd.enable = true;
}
