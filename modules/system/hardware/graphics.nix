
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
  
  # Força o carregamento dos módulos da NVIDIA no initrd (o início do boot).
  # Esta é a correção crucial que resolve o erro "Module not found".
  boot.initrd.kernelModules = lib.mkIf (config.gpuVendor == "nvidia") [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
  ];
  
  # Parâmetros de kernel essenciais para Wayland e Hyprland com NVIDIA.
  boot.kernelParams = lib.mkIf (config.gpuVendor == "nvidia") [
    "nvidia_drm.modeset=1"
  ];

  hardware.nvidia = lib.mkIf (config.gpuVendor == "nvidia") {
    # Habilita o modesetting, essencial para Wayland/Hyprland.
    modesetting.enable = true;
    
    # Usa o driver proprietário para melhor desempenho.
    open = false;
    nvidiaSettings = true;

    # Gerenciamento de energia. 'false' é geralmente mais estável.
    powerManagement.enable = false;

    # Configuração PRIME para notebooks com gráficos híbridos (essencial para si).
    # Habilita o comando `prime-run`.
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
    };

    # Garante que a versão do driver corresponda ao kernel em execução.
    # Isto agora funcionará porque o seu kernel.nix define o kernelPackages.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  
  # ====================================================================

  # 3. Bloco para AMD/Intel (para testes em VM ou outras máquinas)
  # ====================================================================
  hardware.graphics.extraPackages = with pkgs;
    lib.mkIf (config.gpuVendor == "amd" || config.gpuVendor == "intel") [
      amdvlk
    ];
}
