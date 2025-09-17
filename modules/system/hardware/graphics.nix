# /modules/system/hardware/graphics.nix
#
# Manages graphics hardware for all GPUs.
# Enables 32-bit support, OpenGL/Vulkan, and optional vendor drivers.

{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    package = pkgs.mesa.drivers;
    package32 = pkgs.pkgsi686Linux.mesa.drivers;

    extraPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
      libva
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      vulkan-loader
      libva
    ];
  };

  # Vendor-specific video drivers (uncomment as needed)
  # Intel: usually auto-detected
  # services.xserver.videoDrivers = [ "intel" ];

  # AMD:
  # services.xserver.videoDrivers = [ "amdgpu" ];

  # NVIDIA proprietary:
  services.xserver.videoDrivers = [ "nvidia" ];
}
