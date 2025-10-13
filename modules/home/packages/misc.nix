{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bemoji                 # Emoji picker
    nix-prefetch-scripts   # Nix helper for prefetching sources
  ];
}