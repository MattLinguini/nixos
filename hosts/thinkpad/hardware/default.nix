{ config, lib, outputs, pkgs, ... }: 

{
    imports = [
        ./graphics
        ./power
        ./input
    ];
}
