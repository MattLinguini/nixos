{pkgs, ...}: 

{
    imports = [];

    programs.zoxide = {
        enable = true;
        enableFishIntegration = true;
    };

    programs.eza = {
        enable = true;
        enableFishIntegration = true;
        extraOptions = ["-l" "--icons" "--git" "-a"];
    };

    programs.bat = {enable = true;};

    home.packages = with pkgs; [
        coreutils
        fd
        gcc
        btop
        xh
        jq
        procs
        ripgrep
        tldr
        zip
    ];
}
