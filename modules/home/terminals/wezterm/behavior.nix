{ pkgs, ... }: {
  programs.wezterm.extraConfig = ''
    local wezterm = require("wezterm")
    local config = wezterm.config_builder()

    config.max_fps = 180
    config.scrollback_lines = 10000
    config.enable_scroll_bar = true
    config.hide_tab_bar_if_only_one_tab = false
    config.use_fancy_tab_bar = false
    config.tab_max_width = 25
    config.window_close_confirmation = "NeverPrompt"
    config.adjust_window_size_when_changing_font_size = false
    config.audible_bell = "Disabled"
    config.warn_about_missing_glyphs = false
    config.default_cursor_style = "BlinkingBlock"

    return config
  '';
}
