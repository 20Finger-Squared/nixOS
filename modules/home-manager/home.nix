{
  colourscheme,
  inputs,
  ...
}:
{
  home-manager.users."tf" = {
    imports = [
      ({ ... }: {
        home.stateVersion = "26.05";
        home-manager-config = {
          tmux = true;
          gtk = true;
          zoxide = true;
          qutebrowser = true;
          fzf = true;
          zsh = true;
          eza = true;
          starship = true;
          nixvim = true;
          vesktop = true;
          kitty = true;
          hyprland = true;
          hyprtoolkit = true;
          hyprlauncher = true;
        };
      })

      inputs.self.outputs.homeManagerModules.default
    ];
  };
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit colourscheme;
    };
  };
}
