{ lib, ... }:

{
  programs.wezterm = {
    enable = true;

    # Build configuration by merging Lua fragments.
    extraConfig = let
      luaParts = [
        (builtins.readFile ./behavior.nix)
        (builtins.readFile ./core.nix)
        (builtins.readFile ./ui.nix)
        (builtins.readFile ./mouse.nix)
        (builtins.readFile ./keys.nix)
        (builtins.readFile ./user.nix)
      ];
    in ''
      -- Weaver WezTerm configuration
      -- Simple modules. Clear meanings. Growth without chaos.

      local wezterm = require("wezterm")
      local act = wezterm.action
      local config = wezterm.config_builder()

      ${lib.concatStringsSep "\n" luaParts}

      return config
    '';
  };
}
