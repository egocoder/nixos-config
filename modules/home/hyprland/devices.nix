# modules/home/hyprland/devices.nix

# Philosophy: Simple module for per-device input overrides.
# Clear meaning: Patches hardware-specific quirks (like XWayland button mapping).
# Growth without chaos: New devices can be added here without touching core settings.
{
  wayland.windowManager.hyprland.settings = {
    # Esta sintaxe de lista gera os múltiplos blocos `device { ... }`
    # necessários no hyprland.conf.
    device = [
      {
        name = "compx-mad-8k-dongle-mouse";
        map_button = [
          "BTN_EXTRA,8"
          "BTN_SIDE,9"
        ];
      }
      {
        name = "teclado-gamer-husky-hailstrom-mouse";
        map_button = [
          "BTN_EXTRA,8"
          "BTN_SIDE,9"
        ];
      }
    ];
  };
}
