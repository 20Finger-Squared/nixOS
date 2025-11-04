{ pkgs, ... }:
{
        users.users.tf.package = let
            customDwlPackage = (pkgs.dwl.override {
                configH = ./dwl/config.h;
             }).overrideAttrs (oldAttrs: {
                patches = (oldAttrs.patches or []) ++ [
                    ./dwl-patches/warpcursor.patch
                ];
                buildInputs = oldAttrs.buildInputs or [] ++ [ pkgs.libdrm pkgs.fcft ];
            });
        in  [customDwlPackage];
}
