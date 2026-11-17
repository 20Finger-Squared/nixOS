{
  /*
   I decided to use qml files over nix.
   The reason for such is that quickshell doesn't have a way to configure it within nix.
  */
  flake.quickshell-config.default = ./.;
}
