{ pkgs, ... }:
{
        users.users.tf.packages = let
            customDwlPackage = (pkgs.dwl.override {
                configH = ./dwl/config.h;
             }).overrideAttrs (oldAttrs: {
                patches = (oldAttrs.patches or []) ++ [
                    ./dwl-patches/warpcursor.patch
                    ./dwl-patches/gaps.patch
                ];
                buildInputs = oldAttrs.buildInputs or [] ++ [ pkgs.libdrm pkgs.fcft ];
            });
        in  [customDwlPackage];
}
