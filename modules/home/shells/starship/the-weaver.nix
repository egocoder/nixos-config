# modules/home/shells/starship/the-weaver.nix
{
  # "The Weaver" - A personal, clutter-free theme powered by Stylix.
  # This version is fine-tuned to match the exact desired layout.

  programs.starship.settings = {
    # All `palette` definitions are REMOVED. Stylix is the source of truth.

    # The format string arranges modules with clear separators.
    format = "$username:$directory $hostnamet_branch\n$character";

    # Username uses "Golden Thread" color.
    username = {
      show_always = true;
      style = "base0A";
      format = "[$user]($style)";
    };

    # Directory uses "Echoing Teal" and now uses the '~' symbol for home.
    directory = {
      style = "base0C";
      # FIX: Use `home_symbol` for a clear representation of the home directory.
      # Truncation is removed to show the full relevant path.
      home_symbol = "~";
      format = "[$path]($style)";
    };

    # Hostname uses "Weaver's Indigo".
    hostname = {
      ssh_only = false;
      style = "base0D";
      format = "[$hostname]($style) ";
    };

    # Git branch uses "Twilight Plum" and removes the word "on".
    git_branch = {
      style = "base0E";
      symbol = "";
      # FIX: The word "on" is removed from the format string for a cleaner look.
      # The meaning is clear without it.
      format = "[$symbol $branch]($style)";
    };

    # Character uses "Verdant Fate" and "Frayed Thread".
    character = {
      success_symbol = "[λ](bold base0B)";
      error_symbol   = "[λ](bold base08)";
    };
  };
}