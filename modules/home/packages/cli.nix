{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    bc
    bottom
    brightnessctl
    cliphist
    eza
    ffmpeg
    ffmpegthumbnailer
    fzf
    git-graph
    grimblast
    htop
    hyprpicker
    ntfs3g
    mediainfo
    fastfetch
    microfetch
    playerctl
    ripgrep
    showmethekey
    silicon
    udisks
    ueberzugpp
    unzip
    w3m
    wget
    wl-clipboard
    wtype
    yt-dlp
    zip
    tree
    unrar
  ];
}