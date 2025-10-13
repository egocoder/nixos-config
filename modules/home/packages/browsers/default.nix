# --- Browser Aggregator ---
# Purpose: Aggregate browser modules into one clear entry point.
# Each browser configuration is a self-contained module.
# This file only collects and exposes them.
{ pkgs, ... }:

{
  imports = [
    ./librewolf.nix
    ./firefox.nix
  ];
}