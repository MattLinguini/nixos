{ config, lib, pkgs, ... }: 

{
    programs.fish = {
        enable = true;
        loginShellInit = ''
            set -x NIX_PATH nixpkgs=channel:nixos-unstable
            set -x NIX_LOG info

            if test -z "$DISPLAY"; and test (tty) = "/dev/tty1"
                exec Hyprland
            end
        '';
        shellAbbrs = {
            ls = "eza";
            grep = "rg";
            ps = "procs";
            cat = "bat";
        };
    };

    programs.zoxide = {
        enableFishIntegration = true;
    };

    programs.eza = {
        enableFishIntegration = true;
    };
}