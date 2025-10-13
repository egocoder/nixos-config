-- Key bindings — simple, memorable, consistent

config.keys = {
  -- Reload and session
  { key = "r", mods = "ALT",  action = act.ReloadConfiguration },

  -- Tab control
  { key = "Enter", mods = "ALT",  action = act.SpawnTab("CurrentPaneDomain") },
  { key = "w",     mods = "ALT",  action = act.CloseCurrentTab { confirm = true } },
  { key = "p",     mods = "CTRL", action = act.ActivateTabRelative(-1) },
  { key = "n",     mods = "CTRL", action = act.ActivateTabRelative(1) },

  -- Pane navigation
  { key = "LeftArrow",  mods = "ALT", action = act.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },
  { key = "UpArrow",    mods = "ALT", action = act.ActivatePaneDirection("Up") },
  { key = "DownArrow",  mods = "ALT", action = act.ActivatePaneDirection("Down") },

  -- Pane resize
  { key = "LeftArrow",  mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
  { key = "RightArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
  { key = "UpArrow",    mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Up", 3 }) },
  { key = "DownArrow",  mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Down", 3 }) },

  -- Splits
  { key = "s", mods = "ALT", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "v", mods = "ALT", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },

  -- Close / quit
  { key = "c", mods = "ALT", action = act.CloseCurrentPane { confirm = true } },
  { key = "q", mods = "ALT", action = act.CloseCurrentTab { confirm = true } },
  { key = "Q", mods = "ALT", action = act.QuitApplication },
}
