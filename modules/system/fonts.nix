{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    fira-code
    miracode
    monocraft
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    nerd-fonts.inconsolata
    nerd-fonts.terminess-ttf
    nerd-fonts.gohufont
    nerd-fonts.symbols-only
  ];
}
