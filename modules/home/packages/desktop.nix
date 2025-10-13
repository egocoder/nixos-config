{ pkgs, ... }:

{
  # --- Philosophy: clear meaning ---
  # User desktop packages only.
  # No global configuration or Nix settings here.

  home.packages = with pkgs; [
    anki
    code-cursor
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
  ];
}
