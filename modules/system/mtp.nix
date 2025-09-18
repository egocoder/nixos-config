{ config, pkgs, ... }:

{
  # Enable MTP/USB services
  services.gvfs.enable = true;       # Virtual filesystem for devices
  services.udisks2.enable = true;    # Disk management service

  # System packages needed for MTP and USB devices
  environment.systemPackages = with pkgs; [
    jmtpfs
    simple-mtpfs
    gvfs
    kdePackages.kio-extras  # Extra KIO plugins (optional)
  ];

  # Enable Android Debug Bridge (ADB)
  programs.adb.enable = true;
}
