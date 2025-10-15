{ pkgs }:

let
  fontStack = {
    monospace = {
      name = "Terminess Nerd Font Mono";
      package = pkgs.nerd-fonts.terminess-ttf;
    };
    sansSerif = {
      name = "Inconsolata Nerd Font";
      package = pkgs.nerd-fonts.inconsolata;
    };
    serif = {
      name = "FiraCode";
      package = pkgs.fira-code;
    };
  };

  extraFonts = with pkgs; [
    miracode
    monocraft
    nerd-fonts.inconsolata
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
