{ ... }:

{
  boot.loader.grub = {
    enable = true;
    version = 2;
    efiSupport = true;         
    device = "nodev";          
    useOSProber = true;        
  };
}