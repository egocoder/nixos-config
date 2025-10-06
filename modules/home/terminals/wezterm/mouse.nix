{ pkgs, ... }: {
  programs.wezterm.extraConfig = ''
    local wezterm = require("wezterm")
    local config = wezterm.config_builder()

    config.mouse_bindings = {
      {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "NONE",
        action = wezterm.action.CompleteSelectionOrOpenLinkAtMouseCursor("Clipboard"),
      },
    }

    return config
  '';
}
