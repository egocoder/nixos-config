{ pkgs, ... }: {
  home.packages = with pkgs; [
    kdePackages.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
}
