{ config, lib, pkgs, ... }: 

{
    home.packages = with pkgs; [
        protonup
    ];

    home.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
        STEAM_FORCE_XWAYLAND = "1";
    };
}
