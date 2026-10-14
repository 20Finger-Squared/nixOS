{ colourscheme, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      palette = "gruvbox";

      add_newline = true;
      line_break.disabled = false;

      username = {
        show_always = true;
        format = "$user";
      };

      hostname = {
        ssh_only = false;
        format = "$hostname";
      };

      directory = {
        truncate_to_repo = false;
        format = "$path";
      };

      git_branch = {
        format = "$branch";
      };

      git_commit = {
        format = "$hash";
      };

      git_state = {
        format = "$state";
      };
      git_status = {
        format = "$all_status$ahead_behind";

        conflicted = "conf:$count ";
        ahead = "↑$count ";
        behind = "↓$count ";
        diverged = "↕$count ";
        untracked = "?:$count ";
        stashed = "stash:$count ";
        modified = "mod:$count ";
        staged = "stage:$count ";
        renamed = "ren:$count ";
        deleted = "del:$count ";
        typechanged = "type:$count ";
      };
      git_metrics = {
        disabled = false;
        format = "+$added -$deleted";
        added_style = "fg:fg";
        deleted_style = "fg:fg";
      };

      time = {
        disabled = false;
        format = "$time";
      };

      format = "[](fg:yellow)[$username@$hostname](bg:yellow fg:fg)[](bg:blue fg:yellow)[ $directory](bg:blue fg:fg)[](bg:purple fg:blue)[ $git_branch $git_commit $git_state $git_status $git_metrics](bg:purple fg:fg)[](fg:purple)$fill[](fg:aqua)[$time](bg:aqua fg:fg)[](fg:aqua)$line_break$character";

      palettes.gruvbox = {
        yellow = "#${colourscheme.base0A}";
        orange = "#${colourscheme.base09}";
        blue = "#${colourscheme.base0D}";
        purple = "#${colourscheme.base0E}";
        aqua = "#${colourscheme.base0C}";
        bg = "#${colourscheme.base07}";
        fg = "#${colourscheme.base00}";
      };
    };
  };
}
