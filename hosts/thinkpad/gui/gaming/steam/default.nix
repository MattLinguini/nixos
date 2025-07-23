{ config, lib, outputs, pkgs, ... }: 

{
    programs.steam = {
        enable = true;
        gamescopeSession = { enable = true; };
    };

    programs.gamemode = { enable = true; };

    environment.sessionVariables = {
        STEAM_FORCE_XWAYLAND = "1";
    };
}
