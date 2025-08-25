{ config, lib, outputs, pkgs, ... }: 

{
    services.xserver = {
        enable = true;
        videoDrivers = [ "intel" "nvidia" ];
    };

    boot.kernelModules = [
        "nvidia"
        "nvidia_modeset"
        "nvidia_uvm"
        "nvidia_drm"
    ];

    boot.blacklistedKernelModules = ["nouveau"];

    hardware = {
        graphics = {
            enable = true;
            enable32Bit = true;
            extraPackages = with pkgs; [
                nvidia-vaapi-driver 
                vulkan-loader
                vulkan-tools
                mesa
                vaapiVdpau
                libvdpau-va-gl
            ];
            extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
        };

        nvidia = {
            open = true;
            nvidiaSettings = true;
            powerManagement = { 
                enable = true; 
                finegrained = true;
            };

            prime = {
                offload = {
                    enable = true;
                    enableOffloadCmd = true;
                };

                intelBusId = "PCI:0:2:0";
                nvidiaBusId = "PCI:1:0:0";
            };

            modesetting = { enable = true; };

            package = config.boot.kernelPackages.nvidiaPackages.latest;
        };
    };
}


