{ pkgs, ... }: {
  home.packages = with pkgs; [
    anki
    code-cursor
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
