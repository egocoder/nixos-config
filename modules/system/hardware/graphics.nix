{ config, lib, pkgs, gpuVendor, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = lib.mkMerge [
      (lib.mkIf (gpuVendor == "amd") (with pkgs; [
        mesa
        vulkan-loader
        vulkan-validation-layers
        vulkan-tools
      ]))

      (lib.mkIf (gpuVendor == "intel") (with pkgs; [
        intel-media-driver
        vulkan-loader
        vulkan-validation-layers
        vulkan-tools
      ]))

      (lib.mkIf (gpuVendor == "nvidia") (with pkgs; [
        vulkan-tools
        glxinfo
        cudatoolkit
      ]))
    ];
  };

  services.xserver.videoDrivers = lib.mkIf (gpuVendor == "nvidia") [ "nvidia" ];

  hardware.nvidia = lib.mkIf (gpuVendor == "nvidia") {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  boot = lib.mkIf (gpuVendor == "nvidia") {
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
    initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    kernelParams = [ "nvidia_drm.modeset=1" ];
  };

  specialisation = lib.mkIf (gpuVendor == "nvidia") {
    gaming-time.configuration = {
      system.nixos.label = "NixOS-Gaming-Mode";
      hardware.nvidia.prime = {
        sync.enable = lib.mkForce true;
        offload.enable = lib.mkForce false;
        offload.enableOffloadCmd = lib.mkForce false;
      };
    };
  };
}
