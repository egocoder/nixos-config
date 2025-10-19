{
  imports = [
    ./settings.nix
    ./animations
    ./binds
    ./env
    ./rules
    ./startup.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;          # Deixa o NixOS gerenciar o pacote principal
    systemd.enable = false;  # Impede o HM de criar o serviço principal
    portalPackage = null;    # FIX: Impede explicitamente o HM de tocar no pacote do portal
  };
}
