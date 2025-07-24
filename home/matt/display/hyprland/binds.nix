{pkgs, ...}: 

{
    wayland.windowManager.hyprland = {
        settings = {
            bind = [
                # Hyprland Specific Binds
                "SUPER, C, killactive"
                "SUPER, V, togglefloating"
                "SUPER, J, togglesplit"
                "SUPER, P, pin"

                # Move Focus
                "SUPER, left, movefocus, l"
                "SUPER, right, movefocus, r"
                "SUPER, up, movefocus, u"
                "SUPER, down, movefocus, d"

                # Open Applications
                "SUPER, Q, exec, kitty"
                "SUPER, R, exec, wofi --show drun"

                # Screenshot
                "SUPER, Print, exec, grim -o \"$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')\""
                "SUPER SHIFT, Print, exec, grim -g \"$(slurp)\""
                "SUPER CONTROL, Print, exec, grim -g \"$(slurp)\" - | wl-copy"
            ] ++ (
                # Workspace Binds
                builtins.concatLists (builtins.genList (i:
                    let ws = i + 1;
                    in [
                        "SUPER, code:1${toString i}, workspace, ${toString ws}"
                        "SUPER SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                    ]
                )9)
            );

            bindm = [
                "SUPER, mouse:272, movewindow"
                "SUPER, mouse:273, resizewindow"
            ];

            bindel = [
                ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
                ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            ];
	    };
    };
}
