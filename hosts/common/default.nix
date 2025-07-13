# Defaults for all system configurations

{ lib, inputs, outputs, pkgs, ... }: 

{
    imports = [ 
        ./users 
        inputs.home-manager.nixosModules.home-manager
    ];

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
        settings = {
            experimental-features = "nix-command flakes";
            trusted-users = [
                "root"
                "matt"
            ];
        };

        gc = {
            automatic = true;
            options = "--delete-older-than 30d";
        };

        optimise.automatic = true;

        registry =
            (lib.mapAttrs (_: flake: {inherit flake;}))
            ((lib.filterAttrs (_: lib.isType "flake")) inputs);
            nixPath = ["/etc/nix/path"];
    };

    home-manager = {
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs outputs; };
        backupFileExtension = "backup";
    };

    users.defaultUserShell = pkgs.fish;
}
