# modules/home/hyprland/animations/base.nix
{
  # Simple modules. Clear meanings. Growth without chaos.
  # Defines the default motion style for the Hyprland desktop.
  # Inspired by a balanced and fluid preset.

  wayland.windowManager.hyprland.settings = {
    # Bézier curves define the speed of an animation over time.
    bezier = [
      "wind, 0.05, 0.9, 0.1, 1.05"
      "winIn, 0.1, 1.1, 0.1, 1.1"
      "winOut, 0.3, -0.3, 0, 1"
      "liner, 1, 1, 1, 1"
      "overshot, 0.05, 0.9, 0.1, 1.05"
      "smoothOut, 0.5, 0, 0.99, 0.99"
      "smoothIn, 0.5, -0.5, 0.68, 1.5"
    ];

    # Animation rules apply curves to different UI elements.
    animation = [
      "windows, 1, 6, wind, slide"
      "windowsIn, 1, 5, winIn, slide"
      "windowsOut, 1, 3, smoothOut, slide"
      "windowsMove, 1, 5, wind, slide"
      "border, 1, 1, liner"
      "borderangle, 1, 180, liner, loop"
      "fade, 1, 3, smoothOut"
      "workspaces, 1, 5, overshot"
    ];
  };
}