{ config, lib, outputs, pkgs, ... }: 

{
    programs.steam = {
        enable = true;
        gamescopeSession = { enable = true; };
        remotePlay.openFirewall = true; 
        dedicatedServer.openFirewall = true; 
    };

    programs.gamemode = { enable = true; };

    environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };

    environment.systemPackages = with pkgs; [
        mangohud 
        protonup
        lutris
    ];
}
