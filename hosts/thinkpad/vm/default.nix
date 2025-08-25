{ config, lib, pkgs, ... }:

let
    devices = [
        "10de:1f11" # Nvidia 2060 mobile GPU
        "10de:10f9" # Nvidia audio controller
    ];
in {
    programs.virt-manager.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
    virtualisation.libvirtd = {
        enable = true;
        qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
            ovmf = {
                enable = true;
                packages = [(pkgs.OVMF.override {
                secureBoot = true;
                tpmSupport = true;
                }).fd];
            };
        };
    };

    boot.kernelParams = [
        "intel_iommu=on"
        "iommu=pt"
        "vfio-pci.ids=${lib.concatStringsSep "," devices}"
    ];

    boot.initrd.kernelModules = [
        "vfio_pci"
        "vfio"
        "vfio_iommu_type1"
    ];

    # Blacklist the nvidia drivers to make sure they don't get loaded
    boot.extraModprobeConfig = ''
        softdep nvidia pre: vfio-pci
        softdep drm pre: vfio-pci
        softdep nouveau pre: vfio-pci
    '';
    boot.blacklistedKernelModules = [
        "nouveau"
        "nvidia"
        "nvidia_drm"
        "nvidia_modeset"
        "i2c_nvidia_gpu"
    ];

    networking.firewall.trustedInterfaces = [ "virbr0" ];
}