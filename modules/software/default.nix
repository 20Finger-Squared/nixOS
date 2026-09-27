{ ... }:
{
  imports = [
    ./git.nix
    ./neovim
    ./nix-helper.nix
    ./input-remapper.nix
    ./tailscale.nix
    ./email.nix
  ];
}
