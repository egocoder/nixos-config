{ config, pkgs, ... }:

{
  networking = {
    # Enable NetworkManager to manage network connections.
    networkmanager.enable = true;

    # Enable the firewall and open the SSH port.
    firewall.enable = true;
    firewall.allowedTCPPorts = [ 22 ]; # [cite: 50]

  };
}