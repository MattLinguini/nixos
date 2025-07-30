{pkgs, ...}: 

{
    wayland.windowManager.hyprland = {
        settings = {
            windowrulev2 = [
                # Ignore maximize requests from apps.
                "suppressevent maximize, class:.*"
            
                # Fix some dragging issues with XWayland
                "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

                # Zen Browser
                "workspace 1,class:^zen$"
                "float, title:^(Picture-in-Picture)$"
                "size 800 450, title:^(Picture-in-Picture)$"
                "pin, title:^(Picture-in-Picture)$"

                # Discord
                "workspace 5,class:^vesktop$"
                "float, title:^(Discord Popout)$"
                "size 800 450, title:^(Discord Popout)$"
                "pin, title:^(Discord Popout)$"

                # Spotify
                "workspace 5,class:^Spotify$"

                # VSCode
                "workspace 2,class:^Code$"

                # Lutris
                "workspace 6,class:^net.lutris.Lutris$"

                # Battle.net
                "workspace 6,class:^battle.net.exe$"
                "tile,class:^battle.net.exe$"

                # World of Warcraft
                "fullscreen,class:^wow.exe$"
                "monitor 2,class:^wow.exe$"
                "workspace 10,class:^wow.exe$"

                # Steam
                "fullscreen,class:^steam_app\d+$"
                "monitor 2,class:^steam_app_\d+$"
                "workspace 10,class:^steam_app_\d+$"

                "float,class:^deadlock.exe$"
                "workspace 9,class:^deadlock.exe$"
                "size 1920 1080, class:^deadlock.exe$"


                # Kitty
                "float,class:^kitty$"
                "size 950 580, class:^kitty$"
                "move 33 59, class:^kitty$"
            ];
	    };
    };
}
