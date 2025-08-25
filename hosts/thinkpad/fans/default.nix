{ config, lib, pkgs, ... }:

{
    services.thinkfan = {
        enable = false;

        levels = [
            [ 0 0 55 ]   # Fan off between 0°C and 55°C
            [ 1 50 60 ]  # Level 1 between 50°C and 60°C
            [ 2 55 65 ]  # Level 2 between 55°C and 65°C
            [ 3 60 70 ]  # Level 3 between 60°C and 70°C
            [ 4 65 75 ]  # Level 4 between 65°C and 75°C
            [ 5 70 80 ]  # Level 5 between 70°C and 80°C
            [ 6 75 85 ]  # Level 6 between 75°C and 85°C
            [ 7 80 90 ]  # Level 7 between 80°C and 90°C
            [ "level auto" 85 255 ] # Max speed above 85°C
        ];
    };
}