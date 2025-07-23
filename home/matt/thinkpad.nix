# Configuration for the 'matt' user on the 'thinkpad' machine.

{ config, ... }: 

{ 
    imports = [ 
        ./home.nix 
        ../common 
        ./cli
        ./display
        ./gui
    ];
}
