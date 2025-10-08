{
  # Enable the Hyprland window manager via Home Manager.
  # This is essential for standalone (non-NixOS) deployments.
  wayland.windowManager.hyprland = {
    enable = true;
    # Recommended for managing user services like hypridle.
    systemd.enable = true;
  };

  # Import all modularized configuration files.
  imports = [
    ./animations
    ./binds
    ./core.nix
    ./decorations.nix
    ./env
    ./input.nix
    ./startup.nix
    #./theme.nix
    ./variables.nix
    ./windowrules
  ];
}