{ ... }:

{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  # Zsh configuration
  programs.zsh = {
    enable = true;

    shellAliases = {
      wkeys = "wshowkeys -b '#282828' -f '#ebdbb2' -s '#458588' -t 1 -a bottom";
      ls = "eza --color auto --icons auto --show-symlinks --git --changed --grid";
      rebuild = "nh os switch ~/nixOS/";
      cdr = ''cd "$(git rev-parse --show-toplevel)"'';
      cd = "z";
      fzf = "fzf --color=16 --reverse --border=sharp --border-label=rounded";
      fvim = "nvim $(fzf)";
    };
    historySubstringSearch.enable = true;

    initContent = ''
      eval "$(zoxide init zsh)"
         eval "$(starship init zsh)"  '';
  };
}
