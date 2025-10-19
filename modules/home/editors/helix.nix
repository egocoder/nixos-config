{ pkgs, lib, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
  };
}
