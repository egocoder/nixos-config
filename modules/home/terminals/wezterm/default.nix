{ lib, pkgs, ... }:

{
  programs.wezterm = {
    enable = true;

    extraConfig = let
      luaParts = [
        # Read static Lua files directly.
        (builtins.readFile ./core.nix)
        (builtins.readFile ./behavior.nix)
        (builtins.readFile ./ui.nix)
        (builtins.readFile ./mouse.nix)
        (builtins.readFile ./keys.nix)
        (builtins.readFile ./user.nix)
        (import ./domains.nix { inherit pkgs; })
      ];
    in ''
      -- Weaver WezTerm configuration

      local wezterm = require("wezterm")
      local act = wezterm.action
      local config = wezterm.config_builder()

      ${lib.concatStringsSep "\n" luaParts}

      return config
    '';
  };
}