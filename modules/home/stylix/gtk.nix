{ pkgs, lib, ... }:

{
  gtk = {
    # Let Stylix handle the main GTK theme for color consistency.
    # We only override the icon theme here.
    iconTheme = {
      name = lib.mkForce "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  # The cursor theme is a global setting, not specific to GTK,
  # but it's logically grouped with other visual elements here.
  home.pointerCursor = {
    name = "macOS";
    package = pkgs.apple-cursor;
    size = 22;
  };
}
