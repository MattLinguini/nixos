{ config, lib, outputs, pkgs, ... }: 

{
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware = {
        graphics = {
            enable = true;
            enable32Bit = true;
        };

        nvidia = {
            open = true;
            powerManagement = { enable = true; };

            prime = {
                offload = {
                    enable = true;
                    enableOffloadCmd = true;
                };

                intelBusId = "PCI:0:2:0";
                nvidiaBusId = "PCI:1:0:0"; 
            };

            modesetting = { enable = true; };
        };
    };
}
