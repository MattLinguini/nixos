# Defaults for all home-manager configurations.

{ config, lib, outputs, pkgs, ... }: 

{
    nixpkgs = {
        overlays = [
            outputs.overlays.additions
            outputs.overlays.modifications
            outputs.overlays.stable-packages
        ];
        config = {
            allowUnfree = true;
        };
    };

    nix = {
        package = lib.mkDefault pkgs.nix;
        settings = {
            experimental-features = ["nix-command" "flakes"];
            warn-dirty = false;
        };
    };
}
