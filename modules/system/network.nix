{ config, pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;

    firewall.enable = true;
    firewall.allowedTCPPorts = [ 22 ];

    useDHCP = true;

    # Hostname can be overridden by flake argument if desired
    # Optional, keep for standalone module flexibility
    # hostName = "hubris";
  };
}
