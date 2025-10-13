# modules/home/hyprland/rules/games.nix
{
  # Simple modules. Clear meanings. Growth without chaos.
  # This module defines specific window rules for gaming applications
  # to ensure an optimal, distraction-free experience.

  wayland.windowManager.hyprland.settings.windowrulev2 = [
    # --- Gaming Rules ---
    # Force games to fullscreen and prevent screen idling.
    "fullscreen, class:^(steam|lutris|heroic)$"
    "idleinhibit focus, class:^(steam|lutris|heroic)$"
  ];
}