{pkgs, ...}: 

{
    imports = [
        ./binds.nix
        ./env.nix
        ./exec.nix
        ./input.nix
        ./monitors.nix
        ./rules.nix
        # ./style.nix
        ./workspaces.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;
    };


    programs.hyprpanel = { enable = true; };

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
