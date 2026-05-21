{lib, pkgs, config, ...}:
{
    options.software-config.git = lib.mkEnableOption "my git config.";
    config = lib.mkIf config.software-config.git {
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
    };
}
