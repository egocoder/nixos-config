{ pkgs, ... }: {
  programs.hyprland.settings.layerrule = [
    "blur, rofi"
    "ignorezero, rofi"
    "blur, notifications"
    "ignorezero, notifications"
    "blur, quickshell:overview"
    "ignorezero, quickshell:overview"
    "ignorealpha 0.5, quickshell:overview"
  ];
}
