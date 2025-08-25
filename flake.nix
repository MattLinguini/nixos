{
    description = "NixOS Flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
		nixos-hardware.url = "github:NixOS/nixos-hardware/master";
        
		home-manager = {
			url = "github:nix-community/home-manager/";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		zen-browser = {
			url = "github:youwen5/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

        cursor = {
            url = "github:omarcresp/cursor-flake/main";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

	outputs = { self, nixpkgs, nixos-hardware, home-manager, zen-browser, cursor, ...} @ inputs: 
	let
		inherit (self) outputs;
		systems = [
			"aarch64-linux"
			"i686-linux"
			"x86_64-linux"
			"aarch64-darwin"
			"x86_64-darwin"
		];
		forAllSystems = nixpkgs.lib.genAttrs systems;
	in {
		packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
		overlays = import ./overlays { inherit inputs; };
		nixosConfigurations = {
			thinkpad = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit inputs outputs; };
				modules = [ 
					./hosts/thinkpad 
					nixos-hardware.nixosModules.lenovo-thinkpad-p1
				];
			};
		};

		homeConfigurations = {
			"matt@thinkpad" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages."x86_64-linux";
				extraSpecialArgs = { inherit inputs outputs; };
				modules = [ ./home/matt/thinkpad.nix ];
			};
		};
	};
}
