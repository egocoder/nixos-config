{ lib, ... }:
let
  bindModules = [
    ./apps.nix
    ./layout.nix
    ./media.nix
    ./screenshot.nix
    ./workspace.nix # <-- Importante que esteja ativo!
    ./user.nix
  ];
  getBinds = bindType:
    lib.concatMap (path: (import path).${bindType} or []) bindModules;
in
{
  wayland.windowManager.hyprland.settings = {
    bind   = getBinds "bind";
    binde  = getBinds "binde";
    bindm  = getBinds "bindm";
    bindl  = getBinds "bindl";
    bindel = getBinds "bindel";
  };
}