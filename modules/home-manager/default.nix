{ colourscheme, inputs, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit colourscheme;
    };

    users.tf = import ./tf;
  };
}
