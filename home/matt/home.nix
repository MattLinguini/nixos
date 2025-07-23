{ config, lib, pkgs, ... }:

{
    home.username = lib.mkDefault "matt";
    home.homeDirectory = lib.mkDefault "/home/${config.home.username}"; 
    programs.home-manager.enable = true;
    home.stateVersion = "25.05";
}
