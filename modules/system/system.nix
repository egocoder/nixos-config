{
  imports = [
    ./boot       # Startup logic (EFI or GRUB)
    ./core       # Fundamental system logic
    ./hardware   # Physical layer (audio, graphics, etc)
    ./services   # Background services and compositors
  ];
}
