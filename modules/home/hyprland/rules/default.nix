# --- Window Rule Aggregator ---
# Simple modules. Clear meanings. Growth without chaos.
#
# Merges all window and layer rules from sub-modules.
{ lib, ... }:
let
  windowRuleModules = [
    ./float.nix
    ./games.nix
    ./opacity.nix
    ./workspaces.nix
    ./user.nix
  ];
  layerRuleModules = [ ./layers.nix ];
  getRules = ruleset: path:
    (import path).wayland.windowManager.hyprland.settings.${ruleset} or [];
in
{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = lib.concatMap (getRules "windowrulev2") windowRuleModules;
    layerrule = lib.concatMap (getRules "layerrule") layerRuleModules;
  };
}