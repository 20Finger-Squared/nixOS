{ ... }:

{
# Zsh configuration
    programs.zsh = {
        enable = true;
        shellAliases = {
            wkeys = "wshowkeys -b '#282828' -f '#ebdbb2' -s '#458588' -t 1 -a bottom";
            ll = "ls -la";
            la = "ls -la";
            ls = "eza --color auto --icons auto --show-symlinks --git --changed --grid";
            rebuild = "sudo nixos-rebuild switch --flake ~/nixOS/.#rhyliePC";
        };
        initContent = ''eval "$(zoxide init zsh)" '';
    };
}
