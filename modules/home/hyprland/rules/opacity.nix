# --- Opacity Rules ---
# Sets transparency for specific window classes.
# Stylix can also manage this, but rules offer finer control.
{
  wayland.windowManager.hyprland.settings.windowrulev2 = [
    "opacity 0.90 0.80, class:^(wezterm|alacritty)$"
    "opacity 0.95 0.85, class:^(code|VSCodium)$"
    "opacity 0.95 0.85, class:^(firefox|librewolf)$"
  ];
}