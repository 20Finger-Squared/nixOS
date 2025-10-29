{ config, pkgs, ... }:

{
    programs.neovim = {
            enable = true;
            defaultEditor = true;
            extraLuaConfig = builtins.concatStringsSep "\n" [builtins.readFile "./lua-files/opts.lua", builtins.readFile "./lua-files/autocmds.lua", builtins.readFile "./lua-files/autocmds.lua"];
            viAlias = true;
            vimAlias = true;
	    plugins = import ./nvim-plugins.nix { inherit pkgs; };
        };
}
