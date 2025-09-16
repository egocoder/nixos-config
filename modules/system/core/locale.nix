{ config, ... }:

{
  time.timeZone = "America/Sao_Paulo";

  i18n = {
    defaultLocale = "en_US.UTF-8";  # Default system locale in English
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "pt_BR.UTF-8/UTF-8"
    ];
  };

  # Keyboard layout for virtual consoles (TTY)
  console = {
    keyMap = "br-abnt2";           # Brazilian ABNT2 layout
    font = "Lat2-Terminus16";      # TTY font
  };
}
