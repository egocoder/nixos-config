{ config, pkgs, lib, ... }:

{
  # 1. Configuração base para todas as GPUs.
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # ====================================================================
  # 2. Bloco de Configuração Específico da NVIDIA
  # Ativado apenas se `gpuVendor = "nvidia";` estiver definido no host.
  # ====================================================================

  # Força a construção do driver NVIDIA para o kernel selecionado.
  # Esta é a correção mais importante para o erro "Module not found".
  boot.extraModulePackages = lib.mkIf (config.gpuVendor == "nvidia") [
    config.boot.kernelPackages.nvidia_x11
  ];

  # Força o carregamento dos módulos da NVIDIA no início do boot.
  boot.initrd.kernelModules = lib.mkIf (config.gpuVendor == "nvidia") [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
  ];

  # Parâmetros de kernel essenciais para Wayland.
  boot.kernelParams = lib.mkIf (config.gpuVendor == "nvidia") [
    "nvidia_drm.modeset=1"
  ];

  hardware.nvidia = lib.mkIf (config.gpuVendor == "nvidia") {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    powerManagement.enable = false;
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
    };
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # ====================================================================
}