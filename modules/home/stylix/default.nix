{ pkgs, ... }:

let
  # Import the font data from the shared library file.
  typography = import ../../lib/typography.nix { inherit pkgs; };
in
{
  imports = [ ./gtk.nix ];

  stylix = {
    enable = true;
    base16Scheme = ./weaver-void.yaml;

    image = ../../../assets/wallpapers/wallpaper-00.png;

    # --- Typography ---
    # The font stack is now sourced directly from the shared library.
    # The meaning is clear: Stylix uses the system's chosen font definitions.
    fonts = typography.stack;

    # --- Application Targets ---
    targets = {
      gtk.enable = true;
      qt.enable = true;
      helix.enable = true;
      hyprland.enable = true;
      hyprpaper.enable = true;
      hyprlock.enable = true;
      starship.enable = false;
      waybar.enable = true;
      wezterm.enable = true;
      wofi.enable = true;
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
