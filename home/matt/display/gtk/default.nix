{pkgs, ...}: 

{
    gtk = {
        enable = true;
        theme = {
            name = "Adwaita-dark"; # Replace with your preferred theme
            package = pkgs.gnome-themes-extra; # Install the theme
        };
        iconTheme = {
            name = "Papirus-Dark"; # Replace with your preferred icon theme
            package = pkgs.papirus-icon-theme; # Install the icon theme
        };
        cursorTheme = {
            name = "Bibata-Modern-Classic"; # Replace with your preferred cursor theme
            package = pkgs.bibata-cursors; # Install the cursor theme
            size = 24; # Adjust for HiDPI (ThinkPad P1 often needs 24 or higher)
        };
    };

    home.packages = with pkgs; [
        gnome-themes-extra
    ];
}
