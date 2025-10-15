# modules/home/shells/starship/default.nix
{
  # Simple modules. Clear meanings. Growth without chaos.
  # This module enables Starship and selects the active theme's STRUCTURE.
  # All COLORS are injected automatically by Stylix.

  # === THEME SELECTOR ===
  # To change the prompt's visual layout, change the import below.
  imports = [
    # ./the-loom.nix  # The two-line, connected theme.
    # ./the-weaver.nix # Your personal, colorful theme.
    ./the-veil.nix  # The minimalist theme.
  ];

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}