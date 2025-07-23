{pkgs, ...}: 

{
    wayland.windowManager.hyprland = {
        settings = {
            workspace = [
                "1,monitor:eDP-1"
                "2,monitor:eDP-1"
                "3,monitor:eDP-1"
                "4,monitor:eDP-1"
                "5,monitor:eDP-1"

                "6,monitor:DP-1"
                "7,monitor:DP-1"
                "8,monitor:DP-1"
                "9,monitor:DP-1"
                "10,monitor:DP-1,border:false,rounding:false" # Gaming Workspace
            ];
	    };
    };
}
