{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings.windowrule = [
    "float, title:^(Picture-in-Picture)$"
    "pin, title:^(Picture-in-Picture)$"
    "keepaspectratio, title:^(Picture-in-Picture)$"
  ];
}