{pkgs, ...}: 

{
    services.hyprpaper = {
        enable = true;

        settings = {
            preload = [ "/home/matt/wallpapers/abstract.png" ];
            wallpaper = [ ",/home/matt/wallpapers/abstract.png" ];
        };
    };
}
