# --- Stylix Main Configuration ---
# Simple modules. Clear meanings. Growth without chaos.
#
# This is the single source of truth for theming. It defines the color
# scheme, fonts, and all application targets. All other modules are
# either overrides or have been removed.
{ pkgs, ... }:

{
  imports = [
    # Import specific overrides for GTK icons and cursors.
    ./gtk.nix
  ];

  stylix = {
    enable = true;

    # --- Core Theme ---
    # The palette is the foundation of the entire visual identity.
    base16Scheme = ./weaver-daemon.yaml;

    # --- Typography ---
    # Defines the font stack for consistency across applications.
    fonts = {
      monospace = {
        name = "JetBrainsMono Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };
      sansSerif = {
        name = "Inter";
        package = pkgs.inter;
      };
      serif = {
        name = "Merriweather";
        package = pkgs.merriweather;
      };
    };

    # --- Application Targets ---
    # A clear list of every application themed by Stylix.
    # Disabling an application here stops Stylix from touching it.
    targets = {
      # System Integration
      gtk.enable = true;
      qt.enable = true;

      # Wayland Ecosystem
      hyprland.enable = true;
      waybar.enable = true;
      wofi.enable = true;
      hyprlock.enable = true;

      # Terminals & Shells
      wezterm.enable = false;
      starship.enable = false;

      # Browsers
      firefox = {
        enable = true;
        profileNames = [ "default" ];
      };
      librewolf = {
        enable = true;
        profileNames = [ "default" ];
      };
    };
  };
}
