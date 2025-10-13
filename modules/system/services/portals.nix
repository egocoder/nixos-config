{ pkgs, ... }:

{
  # Install the necessary portal backends at the system level.
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
  ];

  # Enable the core xdg-desktop-portal service and configure it.
  xdg.portal = {
    enable = true;
    # This configuration explicitly sets the priority order for backends,
    # resolving the evaluation warning. Hyprland is tried first.
    config.common.default = [
      "hyprland"
      "gtk"
    ];
  };
}