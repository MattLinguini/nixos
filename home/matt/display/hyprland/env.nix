{pkgs, ...}: 

{
    wayland.windowManager.hyprland = {
        settings = {
            env = [
                "XCURSOR_SIZE,24"
                "HYPRCURSOR_SIZE,24"
                "LIBVA_DRIVER_NAME,nvidia"
                "__GLX_VENDOR_LIBRARY_NAME,nvidia"
                "GDK_BACKEND,wayland,x11,"
                "QT_QPA_PLATFORM,wayland;xcb"
                "SDL_VIDEODRIVER,wayland"
                "CLUTTER_BACKEND,wayland"
                "XDG_CURRENT_DESKTOP,Hyprland"
                "XDG_SESSION_TYPE,wayland"
                "XDG_SESSION_DESKTOP,Hyprland"
                "ELECTION_OZONE_PLATFORM_HINT,auto"
            ];
	    };
    };
}
