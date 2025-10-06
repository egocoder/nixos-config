{ pkgs, ... }:

let
  defaultAnimations = import ./00-default.nix { inherit pkgs; };
  userAnimations    = import ./user.nix { inherit pkgs; };
in
{
  programs.hyprland.settings.animations = defaultAnimations // userAnimations;
}
