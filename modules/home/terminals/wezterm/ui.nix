{ pkgs, ... }: {
  programs.wezterm.extraConfig = ''
    local wezterm = require("wezterm")
    local config = wezterm.config_builder()

    config.color_scheme = "Builtin Dark+"
    config.font = wezterm.font_with_fallback({
      "Terminess Nerd Font Mono",
      "GohuFont 11 Nerd Font Mono",
    })
    config.font_size = 12.0
    config.window_background_opacity = 0.94
    config.window_decorations = "RESIZE"
    config.window_padding = { left = 2, right = 2, top = 0, bottom = 0 }

    return config
  '';
}
