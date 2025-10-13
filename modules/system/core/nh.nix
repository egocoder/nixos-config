{ username, ... }:

{
  # Philosophy: Simple modules. Clear meaning. Growth without chaos.
  # nh provides a clean and minimal CLI for managing NixOS flakes.

  programs.nh = {
    enable = true;
    flake = "/home/${username}/nixos-config";
    clean = {
      enable = true;
      extraArgs = "--keep-since 4d --keep 3";
    };
  };
}
