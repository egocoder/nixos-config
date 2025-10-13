{ pkgs, ... }:

{
  # Philosophy: Simple modules. Clear meaning. Growth without chaos.
  # Define a clean and functional font stack with developer-focused fonts.

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
