# Configuration for the 'matt' user on the 'thinkpad' host.

{ config, ... }: 

{ 
    imports = [ 
        ./home.nix 
        ../common 
        ./cli
        ./display
    ];

}
