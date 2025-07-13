{ config, lib, pkgs, ... }: 

{
    programs.neovim = {
        enable = true;
        plugins = with pkgs.vimPlugins; [
            nerdtree
        ];
    };
}