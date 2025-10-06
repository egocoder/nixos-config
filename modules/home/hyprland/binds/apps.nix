{ pkgs, ... }:

[
  # Terminal
  "SUPER, RETURN, exec, wezterm"
  "SUPER SHIFT, RETURN, exec, alacritty"

  # File manager / apps
  "SUPER, F, exec, yazi"
  "SUPER, D, exec, pkill rofi || rofi -show drun"
  "SUPER, B, exec, zen-browser"
  "SUPER, C, exec, code --ozone-platform=x11"
  "SUPER, O, exec, obsidian --ozone-platform=x11"
  "SUPER, S, exec, spotify-launcher"
]
