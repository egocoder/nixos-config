{ config, pkgs, ... }:

{
  # Use default stable kernel
  boot ={
    kernelPackages = pkgs.linuxPackages_zen;
  };

  # Optional: Enable kernel modules if needed (e.g., for NVIDIA)
  # boot = {
  #  extraModulePackages = [ pkgs.linuxPackages.nvidia_x11 ];
  # };
}
