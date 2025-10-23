{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libnotify
    xdg-desktop-portal-gtk
  ];
}
