{ config, lib, pkgs, ... }: 

{
    programs.git = {
        enable = true;
        userName = "Matt Bennett";
        userEmail = "matt.bennett715@gmail.com";
    };
}