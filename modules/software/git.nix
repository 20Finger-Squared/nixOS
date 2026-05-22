{ lib, ... }@inputs:
lib.mkSoftwareOption "git" inputs {
  programs.git = {
    enable = true;
    config = {
      core = {
        editor = "nvim";

        autoclf = "input";
      };
      user = {
        name = "Rhylie M. Orton";
        email = "orhylie+git@gmail.com";
      };
      help.autocorrect = 1;
    };
  };
}
