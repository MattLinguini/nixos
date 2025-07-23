{ config, pkgs, inputs, ... }:

{
	imports = [
		./hardware-configuration.nix
	];

	programs.fish.enable = true;

	services.displayManager.ly.enable = true;



	services.thinkfan.enable = true;
	security.polkit.enable = true;
	services.gnome.gnome-keyring.enable = true;
	security.pam.services.hyprland.enableGnomeKeyring = true;

	services.blueman.enable = true;
	hardware.bluetooth.enable = true;
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	boot.initrd.luks.devices."luks-d6fb2261-1123-495f-a4e8-45470ec99a5f".device = "/dev/disk/by-uuid/d6fb2261-1123-495f-a4e8-45470ec99a5f";
	networking.hostName = "thinkpad";
	networking.networkmanager.enable = true;

	time.timeZone = "America/Denver";

	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
		};

	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

	services.printing.enable = true;

	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		vim
		git
		kitty
		inputs.zen-browser.packages.${pkgs.system}.default
		hyprpolkitagent
		vlc
		libvlc
		ly
		tor-browser
	];

	fonts.packages = with pkgs; [
		nerd-fonts.symbols-only
		nerd-fonts.fira-code
		nerd-fonts.jetbrains-mono
		nerd-fonts.iosevka
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-emoji
		font-awesome
		material-design-icons
		liberation_ttf
		corefonts
	];

	system.stateVersion = "25.05";
}

