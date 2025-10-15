{ pkgs }:

let
  fontStack = {
    monospace = {
      name = "Terminess Nerd Font Mono";
      package = pkgs.nerd-fonts.terminess-ttf;
    };
    sansSerif = {
      name = "Terminess Nerd Font Mono";
      package = pkgs.nerd-fonts.inconsolata;
    };
    serif = {
      name = "JetBrainsMonoNL Nerd Font Mono";
      package = pkgs.fira-code;
    };
  };

  extraFonts = with pkgs; [
    miracode
    monocraft
    nerd-fonts.hack
    nerd-fonts.inconsolata
    nerd-fonts.jetbrains-mono
    nerd-fonts.terminess-ttf
    nerd-fonts.gohufont
    nerd-fonts.symbols-only
  ];

in

{
  stack = fontStack;
  packages = [
    fontStack.monospace.package
    fontStack.sansSerif.package
    fontStack.serif.package
  ] ++ extraFonts;
}
