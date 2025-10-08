# modules/system/hardware/graphics.nix
# Manages graphics drivers and related settings.

{ config, pkgs, lib, ... }:

{
  # Enable the graphics stack, including OpenGL. This is the main switch.
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vulkan-loader
      libva
      vulkan-validation-layers
    ];
  };

  # Conditionally configure settings based on the GPU vendor defined per-host.
  environment.systemPackages = with pkgs;
    lib.mkIf (config.gpuVendor == "nvidia") [
      # Makes nvidia-smi and other tools available in the system path.
      config.boot.kernelPackages.nvidiaPackages.stable
    ];

  hardware.nvidia = lib.mkIf (config.gpuVendor == "nvidia") {
    # For Wayland/Hyprland support.
    modesetting.enable = true;

    # Ensures driver version matches the running kernel.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # The 'hardware.opengl' block was here, but has been removed.
  # Its function is now handled by 'hardware.graphics.enable = true;'.

  # Set necessary kernel parameters for NVIDIA on Wayland.
  boot.kernelParams = lib.mkIf (config.gpuVendor == "nvidia") [
    "nvidia_drm.modeset=1"
  ];
}