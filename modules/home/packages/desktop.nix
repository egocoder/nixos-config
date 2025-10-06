{ pkgs, ... }: {
  home.packages = with pkgs; [
    anki
    imv
    mpv
    obs-studio
    obsidian
    pavucontrol
    teams-for-linux
    telegram-desktop
    vesktop
    spotify
    direnv
  ];
}
