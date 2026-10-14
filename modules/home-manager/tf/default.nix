{ ... }@inputs:
{
  imports = [
    ./gtk.nix
    inputs.nixvim.homeManagerModules.nixvim

    ./neovim.nix
    ./zsh.nix
    ./fzf.nix
    ./starship.nix
    ./zoxide.nix
    ./eza.nix
    ./qutebrowser.nix
  ];
  home = {
    stateVersion = "26.05";
  };
}
