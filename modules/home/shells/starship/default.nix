# modules/home/shells/starship/default.nix
{ pkgs, ... }:

{
  # Import the chosen theme file.
  # Change this line to switch themes.
  imports = [ ./the-veil.nix ];

  programs.starship = {
    enable = true;
    # Enable integration for each shell you use.
    enableZshIntegration = true;
    # enableNushellIntegration = true; # Uncomment if you use Nushell
  };
}