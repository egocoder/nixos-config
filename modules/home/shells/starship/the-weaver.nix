# modules/home/shells/starship/the-weaver.nix
{
  # "The Weaver" - A personal, clutter-free theme powered by Stylix.
  # This version is fine-tuned to match the exact desired layout.

  programs.starship.settings = {
    # All `palette` definitions are REMOVED. Stylix is the source of truth.

    # The format string arranges modules with clear separators.
    format = "$username:$directory $git_branch\n$character";

    # Username uses "Golden Thread" color.
    username = {
      show_always = true;
      style = "base0A";
      format = "[$user]($style)";
    };

    # Directory uses "Echoing Teal" and is truncated.
    directory = {
      style = "base0C";
      truncation_length = 1;
      truncation_symbol = "…/";
      format = "[$path]($style)";
    };

    # Git branch uses "Twilight Plum".
    git_branch = {
      style = "base0E";
      symbol = "";
      format = "[$symbol $branch]($style)";
    };

    # Character uses "Verdant Fate" and "Frayed Thread".
    character = {
      success_symbol = "[λ](bold base0B)";
      error_symbol   = "[λ](bold base08)";
    };
  };
}