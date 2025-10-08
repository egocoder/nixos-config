{ lib, ... }:

let

  bindModules = [
    ./apps.nix
    ./layout.nix
    ./media.nix
    ./render.nix
    ./workspaces.nix
    ./user.nix
  ];

  # Import all modules from the list.
  importedBinds = map (p: import p) bindModules;

  mergedBinds = lib.foldl' lib.recursiveUpdate { } importedBinds;

in
{
  # Assign the merged binds to the correct hyprland settings.
  wayland.windowManager.hyprland.settings = mergedBinds;
}