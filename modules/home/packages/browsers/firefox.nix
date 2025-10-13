# --- Firefox Configuration ---
# Simple purpose: a customizable, general-purpose browser.
# Theming is entirely handled by Stylix.
{ pkgs, ... }:
let
  # Import shared browser settings, like extensions.
  common = import ./common.nix { inherit pkgs; };
in
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    languagePacks = [ "en-US" "pt-BR" ];

    profiles.default = {
      isDefault = true;
      name = "default";

      # Use the shared list of extensions.
      extensions.packages = common.extensions;

      # Declarative preferences for usability and consistency.
      settings = {
        "browser.startup.page" = 3; # Restore previous session
        "browser.tabs.drawInTitlebar" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      # The userChrome and userContent are removed.
      # Stylix will generate these files based on your theme.
    };
  };
}