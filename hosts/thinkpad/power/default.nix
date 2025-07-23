{ config, lib, pkgs, ... }:

{
    powerManagement = { enable = true; };

    services = { 
        thermald = { enable = true; };
        upower = { enable = true; };

        logind = {
            lidSwitchDocked = "ignore";
            extraConfig = ''
                IdleAction=suspend
                IdleActionSec=5min
                IdleActionIgnoreInhibited=yes
	        '';
        };
    };

    boot = { 
        kernelParams = [ "acpi_backlight=native" ];
    };
}