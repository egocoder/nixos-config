{ config, pkgs, lib, username, ... }:

{

  # 1. MTP (Media Transfer Protocol) Support
  services.gvfs.enable = true;
  services.udisks2.enable = true; # Manages block devices, often used by MTP.

  environment.systemPackages = with pkgs; [
    # CLI tools for mounting MTP devices if needed
    jmtpfs
    simple-mtpfs
    # Provides MTP support for KDE/Qt applications (useful even outside of KDE)
    kdePackages.kio-extras
  ];

  # 2. ADB (Android Debug Bridge) Support
  programs.adb.enable = true;

  # 3. User Permissions
  # Add the main user to the necessary groups to access devices.
  users.users.${username}.extraGroups = [
    "plugdev"  # General permission for removable devices
    "adbusers" # Specific permission for using ADB
  ];
}
