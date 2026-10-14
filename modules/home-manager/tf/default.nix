{ ... }@inputs:
{
  imports = [

    ./gtk.nix
    ./neovim.nix
    ./zsh.nix
    ./fzf.nix
    ./starship.nix
    ./zoxide.nix
    ./eza.nix
    ./qutebrowser.nix

    inputs.nixvim.homeManagerModules.nixvim
  ];
  home = {
    stateVersion = "26.05";
  };
}
