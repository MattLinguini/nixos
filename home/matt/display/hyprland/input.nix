{pkgs, ...}: 

{
    wayland.windowManager.hyprland = {
        settings = {
            input = {
                kb_layout = "us";
                follow_mouse = "1";
                sensitivity = 0;
                touchpad = {
                    natural_scroll = true;
                    clickfinger_behavior = 1;
                };
            };

            device = {
                name = "logitech-gaming-mouse-g600";
                sensitivity = -0.5;
            };

            gestures = {
                workspace_swipe = true;
                workspace_swipe_fingers = 3;
            };

            cursor = {
                no_hardware_cursors = true;
            };
	    };
    };
}
