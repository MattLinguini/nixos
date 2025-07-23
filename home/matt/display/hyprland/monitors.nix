{pkgs, ...}: 

{
    wayland.windowManager.hyprland = {
        settings = {
            monitor = [
                "eDP-1, 2560x1600@165.02Hz, 0x0, 1.25"
                "DP-1, 2560x1440@143.91Hz, 2560x0, 1"
                ", preferred, auto, 1" # Default monitor rules";
            ];

            xwayland = {
                force_zero_scaling = true;
            };
	    };
    };
}