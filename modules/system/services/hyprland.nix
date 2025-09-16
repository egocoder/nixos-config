{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    # xwayland.enable = false; # Uncomment if you want pure Wayland
  };

  # PAM service for hyprlock
  security.pam.services.hyprlock = {};
}
