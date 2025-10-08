{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    htop
    neovim
    helix

    vulkan-tools
    glxinfo
  ]
  ++ lib.optionals (config.gpuVendor == "nvidia") [
    config.boot.kernelPackages.nvidiaPackages.stable # Para nvidia-smi
    cudaPackages.cudatoolkit
  ];
}
