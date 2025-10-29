{ config, pkgs, ... }:

{
    programs.neovim = {
            enable = true;
            defaultEditor = true;
            extraLuaConfig = import ./nvim-opts.nix;
            viAlias = true;
            vimAlias = true;
	    plugins = import ./nvim-plugins.nix;
        };
}
