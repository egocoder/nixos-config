{ pkgs, ... }:

let
  appsBinds      = import ./apps.nix { inherit pkgs; };
  layoutBinds    = import ./layout.nix { inherit pkgs; };
  mediaBinds     = import ./media.nix { inherit pkgs; };
  renderBinds    = import ./render.nix { inherit pkgs; };
  workspacesBinds= import ./workspaces.nix { inherit pkgs; };
  userBinds      = import ./user.nix { inherit pkgs; };
in
{
  programs.hyprland.settings.bind = appsBinds
                                   ++ layoutBinds
                                   ++ mediaBinds
                                   ++ renderBinds
                                   ++ workspacesBinds
                                   ++ userBinds;
}
