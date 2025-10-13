{ config, pkgs, ... }:

{
  # Philosophy: Simple modules. Clear meaning. Growth without chaos.
  # Choose a performance-optimized kernel and handle GPU modules clearly.

  # Select the Zen kernel for better responsiveness and low latency.
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Load extra kernel modules based on the selected GPU vendor.
  # This avoids mismatch between kernel and module packages.
  boot.extraModulePackages =
    if config.gpuVendor == "nvidia" then
      [ config.boot.kernelPackages.nvidia_x11 ]
    else
      [ ];
}
