{pkgs, ...}: 

{
    imports = [];

    programs.vesktop.enable = true;
    programs.librewolf.enable = true;
    programs.vscode.enable = true;

    home.packages = with pkgs; [
        modrinth-app
        texlive.combined.scheme-full
    ];
}
