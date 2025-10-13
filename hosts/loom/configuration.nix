{ pkgs, stateVersion, hostname, ... }:

{

  imports = [
    ./hardware-configuration.nix
    ./local.nix
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}
