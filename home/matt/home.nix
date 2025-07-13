{ config, lib, pkgs, ... }:

{
    home.username = lib.mkDefault "matt";
    home.homeDirectory = lib.mkDefault "/home/${config.home.username}"; 

    programs.wofi.enable = true;
    programs.vesktop.enable = true;
    programs.librewolf.enable = true;
    programs.vscode.enable = true;

    programs.neovim = {
        enable = true;
        plugins = with pkgs.vimPlugins; [
            nerdtree
        ];
    };

    programs.git = {
        enable = true;
        userName = "Matt Bennett";
        userEmail = "matt.bennett715@gmail.com";
    };

    programs.hyprpanel = {
        enable = true;
    };



    programs.home-manager.enable = true;
    home.stateVersion = "25.05";
}
