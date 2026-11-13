{ colourscheme, inputs, flake, ... }:
{
  home-manager = {
    sharedModules = [ flake.home-manager-modules.default ];
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inputs = inputs;
      colourscheme = colourscheme;
    };
  };
}
