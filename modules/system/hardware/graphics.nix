{ config, pkgs, lib, ... }:

{
  # 1. Configuração base para todas as GPUs
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # 2. Pacotes de sistema para gráficos
  # Este bloco único agora lida com todas as instalações de pacotes de forma condicional.
  environment.systemPackages = with pkgs; [
    # Ferramentas gráficas de propósito geral
    vulkan-tools
    glxinfo
  ]
  # Adiciona pacotes da NVIDIA condicionalmente
  ++ lib.optionals (config.gpuVendor == "nvidia") [
    config.boot.kernelPackages.nvidiaPackages.stable # Para nvidia-smi
    cudaPackages.cudatoolkit
  ]
  # Adiciona pacotes da AMD condicionalmente
  ++ lib.optionals (config.gpuVendor == "amd") [
    amdvlk
  ];

  # ====================================================================
  # 3. Bloco de Configuração Específico da NVIDIA
  # ====================================================================
  boot.kernelParams = lib.mkIf (config.gpuVendor == "nvidia") [
    "nvidia_drm.modeset=1"
  ];

  hardware.nvidia = lib.mkIf (config.gpuVendor == "nvidia") {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    powerManagement.enable = false; # Melhor para desktops
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
    };
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # ====================================================================

  # 4. Bloco de Configuração para AMD/Intel
  # ====================================================================
  hardware.graphics.extraPackages = with pkgs;
    lib.mkIf (config.gpuVendor == "amd" || config.gpuVendor == "intel") [
      amdvlk
    ];
}
