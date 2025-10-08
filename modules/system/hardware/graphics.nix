{ config, pkgs, lib, ... }:

{
  # 1. Base configuration for all GPUs.
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # 2. NVIDIA-specific hardware and kernel configuration.
  boot.initrd.kernelModules = lib.mkIf (config.gpuVendor == "nvidia") [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
  ];

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

  # 3. AMD-specific hardware configuration.
  hardware.graphics.extraPackages = with pkgs;
    lib.mkIf (config.gpuVendor == "amd" || config.gpuVendor == "intel") [
      amdvlk
    ];
}