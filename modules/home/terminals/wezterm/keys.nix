{ pkgs, ... }: {
  programs.wezterm.extraConfig = ''
    local wezterm = require("wezterm")
    local act = wezterm.action
    local config = wezterm.config_builder()

    config.keys = {
      -- Reload / Tabs
      { key = "r", mods = "ALT", action = act.ReloadConfiguration },
      { key = "p", mods = "CTRL", action = act.ActivateTabRelative(-1) },
      { key = "n", mods = "CTRL", action = act.ActivateTabRelative(1) },
      { key = "Enter", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
      { key = "w", mods = "ALT", action = act.CloseCurrentTab { confirm = true } },

      -- Tab Navigation
      { key = "1", mods = "ALT", action = act.ActivateTab(0) },
      { key = "2", mods = "ALT", action = act.ActivateTab(1) },
      { key = "3", mods = "ALT", action = act.ActivateTab(2) },
      { key = "4", mods = "ALT", action = act.ActivateTab(3) },
      { key = "5", mods = "ALT", action = act.ActivateTab(4) },
      { key = "6", mods = "ALT", action = act.ActivateTab(5) },
      { key = "7", mods = "ALT", action = act.ActivateTab(6) },
      { key = "8", mods = "ALT", action = act.ActivateTab(7) },
      { key = "9", mods = "ALT", action = act.ActivateTab(8) },

      -- Pane Navigation
      { key = "LeftArrow",  mods = "ALT", action = act.ActivatePaneDirection("Left") },
      { key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },
      { key = "UpArrow",    mods = "ALT", action = act.ActivatePaneDirection("Up") },
      { key = "DownArrow",  mods = "ALT", action = act.ActivatePaneDirection("Down") },

      -- Pane Resize
      { key = "LeftArrow",  mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
      { key = "RightArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
      { key = "UpArrow",    mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Up", 3 }) },
      { key = "DownArrow",  mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Down", 3 }) },

      -- Splits
      { key = "s", mods = "ALT", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
      { key = "v", mods = "ALT", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },

      -- Close/Quit
      { key = "c", mods = "ALT", action = act.CloseCurrentPane { confirm = true } },
      { key = "q", mods = "ALT", action = act.CloseCurrentTab { confirm = true } },
      { key = "Q", mods = "ALT", action = act.QuitApplication },
    }

    return config
  '';
}