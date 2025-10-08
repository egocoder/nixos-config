{ pkgs, ... }:

{
  # Example of an override to make workspaces move faster:
  # wayland.windowManager.hyprland.settings.animation = [
  #   "workspaces, 1, 7, wind"
  # ];

  # Example of a new bezier curve:
  # wayland.windowManager.hyprland.settings.bezier = [
  #   "myCurve, 0.1, 0.9, 0.2, 1.0"
  # ];
}