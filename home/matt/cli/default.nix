{pkgs, ...}: 

{
    imports = [ 
        ./fish.nix 
        ./fzf.nix
        ./git.nix
        ./neovim.nix
        ./protonup.nix
    ];

    programs.zoxide = {
        enable = true;
    };

    programs.eza = {
        enable = true;
        extraOptions = ["-l" "--icons" "--git" "-a"];
    };

    programs.bat = { enable = true; };

    home.packages = with pkgs; [
        uutils-coreutils-noprefix
        fd
        gcc
        btop
        xh
        jq
        procs
        ripgrep
        tldr
        zip
        neofetch
    ];
}
