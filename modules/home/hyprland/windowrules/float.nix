{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings.windowrule = [
    "float, title:^(Save As)$"
    "float, title:^(Authentication Required)$"
    "center, title:^(Save As)$"
    "center, class:^(pavucontrol|org.pulseaudio.pavucontrol)$"
    "float, class:^(fdm|freedownloadmanager)$"
  ];
}