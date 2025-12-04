{ ... }:
{
  services = {
    # Btrfs
    btrfs.autoScrub = {
      enable = true;
      interval = "weekly";
    };
  };
}
