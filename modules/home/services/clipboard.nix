# modules/home/services/clipboard.nix (ou adicionar em cli.nix)
{ pkgs, ... }:

{
  # Habilita o serviço para persistência do clipboard
  services.wl-clip-persist.enable = true;

  # Garante que os pacotes estejam instalados (embora já estejam no seu cli.nix)
  home.packages = [
    pkgs.wl-clipboard
    pkgs.cliphist
  ];
}
