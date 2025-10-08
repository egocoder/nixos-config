{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings.windowrule = [
    "opacity 0.8 0.7, tag:terminal*"
    "opacity 0.9 0.8, tag:projects*"
    "opacity 0.9 0.7, tag:browser*"
    "opacity 0.9 0.7, class:^(zen)$"
  ];
}