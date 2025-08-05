{ programs }:
{
# Zsh configuration
    programs.zsh = {
        enable = true;
        shellAliases = {
            wkeys = "wshowkeys -b '#282828' -f '#ebdbb2' -s '#458588' -t 1 -a bottom";
            ll = "ls -la";
            la = "ls -la";
            rebuild = "sudo nixos-rebuild switch --flake ~/nixOS/.#rhyliePC";
        };
    };
}
