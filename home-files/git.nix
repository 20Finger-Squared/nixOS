{ pkgs, ... }:

{
  home.packages = [ pkgs.git ];
  programs.git.enable = true;
  programs.git = {
    userEmail = "orhylie@gmail.com";
    userName = "20Finger-Squared";
  };
}
