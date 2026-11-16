{ colourscheme, inputs, flake, config, ... }:
{
home-manager = {
  sharedModules = config.home-manager-modules ++ [
    inputs.nixvim.homeModules.nixvim
  ];

  useGlobalPkgs = true;
  useUserPackages = true;

  extraSpecialArgs = {
    inherit colourscheme inputs flake;
  };
};
}
