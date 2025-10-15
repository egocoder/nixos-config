# modules/home/shells/starship/the-veil.nix
{
  # "The Veil" - Conceals excess; only essence remains.
  # This file defines the theme's structure. Colors are now managed by Stylix.

  programs.starship.settings = {
    # The `palette` and `palettes` sections are REMOVED.
    # Stylix injects the `base00` through `base0F` colors automatically.

    # The format string now only defines the layout of modules.
    # Each module is responsible for its own styling.
    format = "$username$directory $git_branch\n$character";

    # Username uses "Golden Thread" from your Stylix theme.
    username = {
      show_always = true;
      style = "base0A";
      format = "[$user]($style)";
    };

    # Directory uses "Echoing Teal".
    directory = {
      style = "base0C";
      truncation_length = 3;
      truncation_symbol = "…/";
      format = "[:$path]($style)";
    };

    # Git branch uses "Weaver's Indigo".
    git_branch = {
      style = "bold base0D";
      symbol = "";
      format = "on [$symbol $branch]($style)";
    };

    # Character uses "Verdant Fate" and "Frayed Thread".
    character = {
      success_symbol = "[λ](bold base0B)";
      error_symbol   = "[λ](bold base08)";
    };
  };
}