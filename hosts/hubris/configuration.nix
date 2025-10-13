{ pkgs, stateVersion, hostname, ... }:

{
  # Philosophy: Simple modules. Clear meaning. Growth without chaos.

  imports = [
    ./hardware-configuration.nix
    ./local.nix
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}
