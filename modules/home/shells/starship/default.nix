{ lib, ... }: # <--- Verifique se esta linha está aqui

{
  imports = [
    ./the-weaver.nix
  ];

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
