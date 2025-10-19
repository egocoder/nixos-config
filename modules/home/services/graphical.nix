{ pkgs, ... }:

{
  # Enable the swww daemon service via Home Manager
  services.swww = {
    enable = true;
    # Você pode adicionar args extras se precisar, ex:
    # extraArgs = ["--no-outputs"];
  };

  # Instala o pacote swww para ter o comando 'swww' disponível
  home.packages = [ pkgs.swww ];
}
