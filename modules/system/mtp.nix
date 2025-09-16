services.gvfs.enable = true;
services.udisks2.enable = true;

environment.systemPackages = with pkgs; [
  jmtpfs
  simple-mtpfs
  gvfs
  kdePackages.kio-extras
];

programs.adb.enable = true;
