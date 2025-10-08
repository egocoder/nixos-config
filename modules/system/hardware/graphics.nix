{ config, pkgs, lib, ... }:

{
  # 1. Base configuration for all GPUs.
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # 2. System-wide graphics packages.
  # This single block now handles all package installations conditionally.
  environment.systemPackages = with pkgs; [
    # General-purpose graphics tools
    vulkan-tools
    glxinfo
  ]
  # Conditionally add NVIDIA packages using lib.optionals
  ++ lib.optionals (config.gpuVendor == "nvidia") [
    config.boot.kernelPackages.nvidiaPackages.stable # For nvidia-smi
    cudaPackages.cudatoolkit
  ]
  # Conditionally add AMD packages using lib.optionals
  ++ lib.optionals (config.gpuVendor == "amd") [
    amdvlk
  ];

  # 3. NVIDIA-specific hardware configuration.
  hardware.nvidia = lib.mkIf (config.gpuVendor == "nvidia") {
    open = false;
    nvidiaSettings = true;
    modesetting.enable = true;
    powerManagement.enable = true;
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
    };
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # 4. NVIDIA-specific kernel parameters.
  boot.kernelParams = lib.mkIf (config.gpuVendor == "nvidia") [
    "nvidia_drm.modeset=1"
  ];
}