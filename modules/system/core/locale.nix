{ config, ... }:

{
  
  # Set system timezone
  time.timeZone = "America/Sao_Paulo";

  # Configure system locales
  i18n = {
    defaultLocale = "en_US.UTF-8";    # English as default
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "pt_BR.UTF-8/UTF-8"             # Brazilian Portuguese
    ];
  };

  # Console (TTY) keyboard and font settings
  console = {
    keyMap = "br-abnt2";              # Brazilian ABNT2 layout
    font = "Lat2-Terminus16";         # TTY font for readability
  };
}
