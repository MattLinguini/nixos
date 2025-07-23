{ config, lib, pkgs, ... }:

{
    powerManagement.enable = true;
    services.thermald.enable = true;
    boot.kernelParams = [ "acpi_backlight=native" ]; # For ThinkPad backlight control
}