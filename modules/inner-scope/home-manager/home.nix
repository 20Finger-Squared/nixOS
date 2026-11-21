{ colourscheme, inputs, flake, config, ... }:
{
home-manager = {
  sharedModules = config.home-manager-modules ++ [
    inputs.nixvim.homeModules.nixvim
    inputs.nix4nvchad.homeManagerModules.default
    inputs.mangowm.hmModules.mango
  ];

  useGlobalPkgs = true;
  useUserPackages = true;

  extraSpecialArgs = {
    inherit colourscheme inputs flake;
  };
};
}
