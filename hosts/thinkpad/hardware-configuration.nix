{ config, lib, pkgs, modulesPath, ... }:

{
	imports = [ 
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-intel" ];
	boot.extraModulePackages = [ ];

	fileSystems."/" = {
		device = "/dev/disk/by-uuid/a29b86d4-04fc-4962-8261-004ca5790d64";
		fsType = "ext4";
	};

	boot.initrd.luks.devices."luks-8092fd24-6543-43ea-9164-e15550077788".device = "/dev/disk/by-uuid/8092fd24-6543-43ea-9164-e15550077788";

	fileSystems."/boot" = { 
		device = "/dev/disk/by-uuid/D6E3-34FF";
		fsType = "vfat";
		options = [ "fmask=0077" "dmask=0077" ];
	};

	swapDevices = [ 
		{ device = "/dev/disk/by-uuid/4cc35242-50eb-4f62-a2eb-e078ea7597df"; }
	];

	networking.useDHCP = lib.mkDefault true;

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
