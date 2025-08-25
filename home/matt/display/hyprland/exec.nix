{pkgs, ...}: 

{
    wayland.windowManager.hyprland = {
        settings = {
            exec = [
                "hyprpanel"
                "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
                "hyprctl hyprpaper wallpaper \",/home/matt/wallpapers/abstract.png\""
            ];
	    };
    };
}
