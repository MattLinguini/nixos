{ config, pkgs, inputs, ... }:

{
    users.users.matt = {
        isNormalUser = true;
        description = "Matt Bennett";
        extraGroups = [
            "wheel"
            "networkmanager"
        ];
        packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
        shell = pkgs.fish;
    };

    home-manager.users.matt = import ../../../home/matt/${config.networking.hostName}.nix;
}