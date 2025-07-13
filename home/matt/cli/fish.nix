{ config, lib, pkgs, ... }: 

{
    programs.fish = {
        enable = true;
        loginShellInit = ''
            set -x NIX_PATH nixpkgs=channel:nixos-unstable
            set -x NIX_LOG info
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