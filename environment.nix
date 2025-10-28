{config, ...}:

{
	environment.sessionVariables = rec {
		XDG_BIN_HOME = "$HOME/.bin";
    WLR_RENDER = "pixman";
	};
}
