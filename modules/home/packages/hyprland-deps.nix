{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.xwaylandvideobridge
    libnotify
    # xdg-desktop-portal-gtk # REMOVIDO: Agora é gerenciado por modules/home/portals.nix
  ];
}