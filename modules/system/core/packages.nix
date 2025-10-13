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
    ];
}
