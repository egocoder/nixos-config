{ config, pkgs, ... }:

{
  # Philosophy: Simple modules. Clear meaning. Growth without chaos.
  # Enable Hyprland — a modern, dynamic Wayland compositor.

  programs.hyprland = {
    enable = true;       # Enable Hyprland itself
    withUWSM = true;     # Use Wayland Session Manager integration
    # xwayland.enable = false; # Uncomment for pure Wayland setups
  };

  # Register PAM service for Hyprlock (screen locker)
  security.pam.services.hyprlock = {};
}
