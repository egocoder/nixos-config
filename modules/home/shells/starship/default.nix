# modules/home/shells/starship/default.nix
{
  # Simple modules. Clear meanings. Growth without chaos.
  # This module enables Starship and selects the active theme's STRUCTURE.
  # All COLORS are injected automatically by Stylix.

  # === THEME SELECTOR ===
  # To change the prompt's visual layout, change the import below.
  imports = [
    ./the-weaver.nix
  ];

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}