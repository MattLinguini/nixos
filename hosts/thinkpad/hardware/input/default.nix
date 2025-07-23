{ config, lib, pkgs, ... }:

{
    hardware.trackpoint = {
        emulateWheel = true;
        sensitivity = 200; # Adjust as needed
    };
}