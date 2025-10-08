{ config, pkgs, ... }:{
  imports = [

    # Bootloaders
    ./boot/efi.nix
    # ./boot/grub.nix  # Uncomment if using GRUB instead of EFI

    # Core system
    ./core/default.nix
    ./mtp.nix
    ./mime.nix

    # Networking
    ./network.nix

    # Nix optimizations
    ./nix.nix

    # Packages and users
    ./packages.nix
    ./users.nix

    # Hardware modules
    ./hardware

    # Fonts
    ./fonts.nix

    # Services
    ./services
  ];
}
