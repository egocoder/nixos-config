{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "tag +browser, class:^(zen)$"
      "tag +terminal, class:^(wezterm|alacritty)$"
      "tag +im, class:^([Vv]esktop|[Ww]hatsapp-for-linux)$"
      "tag +projects, class:^(code|VSCodium)$"
      "tag +games, class:^(steam|steam_app_\\d+)$"
    ];
  };
}