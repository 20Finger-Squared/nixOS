{config, pkgs, ... }:

{
    programs.neovim = {
            enable = true;
            defaultEditor = true;
            extraLuaConfig = "";
            viAlias = true;
            vimAlias = true;
            plugins = with pkgs.vimPlugins; [
            ];
        };
}
