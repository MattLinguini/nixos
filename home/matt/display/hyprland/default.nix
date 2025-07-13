{pkgs, ...}: 

{
    imports = [ 
        
    ];

    home.packages = with pkgs; [
        grim
        hyprlock
        qt6.qtwayland
        slurp
        waypipe
        wf-recorder
        wl-mirror
        wl-clipboard
        wlogout
        wtype
        ydotool
    ];
}
