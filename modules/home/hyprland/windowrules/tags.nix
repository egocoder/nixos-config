{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings.windowrule = [
    "workspace 1, tag:projects*"
    "workspace 2, tag:browser*"
    "workspace 3, tag:file-manager*"
    "workspace 4, tag:im*"
    "workspace 8, tag:games*"
  ];
}