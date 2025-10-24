{ pkgs, ... }:

{
  # --- Philosophy: clear meaning ---
  # User desktop packages only.
  # No global configuration or Nix settings here.

  home.packages = with pkgs; [
    anki
    vscode
    direnv
    imv
    mpv
    obs-studio
    obsidian
    pavucontrol
    spotify
    teams-for-linux
    telegram-desktop
    vesktop
    zapzap
    r2modman
  ];
}
