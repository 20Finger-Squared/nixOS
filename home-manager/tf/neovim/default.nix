{ lib, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    initLua = ''
      		${
          builtins.concatStringsSep "\n" (
            map builtins.readFile ([ ./lua/leader-keys.lua ] ++ (lib.filesystem.listFilesRecursive ./lua))
          )
        }
      	      	'';
    plugins = with pkgs.vimPlugins; [
      gruvbox-nvim

      mini-ai
      mini-align
      mini-move
      mini-pairs
      mini-surround
      mini-bracketed
      mini-cmdline
      mini-cursorword
      mini-files
      mini-pick # because yes i do forget my own keymaps, so what?
      mini-clue
      mini-trailspace
      mini-icons
      mini-cursorword
    ];
  };
}
