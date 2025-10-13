{ lib, pkgs, ... }:
{
  # --- Yazi Terminal File Manager ---
  # Simple module. Clear meaning. Growth without chaos.

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;

    # Core and UI behavior
    settings = import ./core.nix;
    theme = import ./theme.nix;
    keymap = import ./keys.nix;
  };

  # Separate plugin definition for clarity
  imports = [ ./plugins.nix ];
}
