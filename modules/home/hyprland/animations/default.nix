# --- Animation Aggregator ---
# Simple modules. Clear meanings. Growth without chaos.
#
# Merges all animation settings from sub-modules.
{ lib, ... }:
let
  # List of modules defining Bézier curves and animation rules.
  animationModules = [
    ./base.nix   # Provides the default animations
    ./user.nix   # User overrides and additions
  ];

  # Helper to collect settings for a given key ("bezier" or "animation").
  getAnimationSettings = key:
    lib.concatMap (path:
      let imported = import path;
      in imported.wayland.windowManager.hyprland.settings.${key} or []
    ) animationModules;
in
{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;
    };
    # Merge all bezier curves and animation rules.
    bezier    = getAnimationSettings "bezier";
    animation = getAnimationSettings "animation";
  };
}