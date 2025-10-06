{ pkgs, ... }: {
  programs.wezterm.extraConfig = ''
    local wezterm = require("wezterm")
    local config = wezterm.config_builder()

    -- Example: Enable background blur on Wayland when supported
    -- config.window_background_opacity = 0.92

    return config
  '';
}
