# --- Librewolf Configuration ---
# Simple purpose: a secure, privacy-focused browser.
# Theming is entirely handled by Stylix.
{ pkgs, ... }:
let
  # Import shared browser settings, like extensions.
  common = import ./common.nix { inherit pkgs; };
in
{
  programs.librewolf = {
    enable = true;
    languagePacks = [ "en-US" "pt-BR" ];

    profiles.default = {
      isDefault = true;
      name = "default";

      # Use the shared list of extensions.
      extensions.packages = common.extensions;

      # Declarative preferences for privacy and usability.
      settings = {
        "browser.startup.page" = 3; # Restore previous session
        "privacy.trackingprotection.enabled" = true;
        "privacy.resistFingerprinting" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      
      # The userChrome and userContent are removed.
      # Stylix will generate these files based on your theme.
    };
  };
}