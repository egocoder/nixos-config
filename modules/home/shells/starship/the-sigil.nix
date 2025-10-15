# modules/home/shells/starship/the-sigil.nix
{
  # "The Sigil" - A personalized Weaver theme.
  # This theme is now built from modular components instead of hardcoded text,
  # ensuring it adapts to any user or host.

  programs.starship.settings = {
    # The `palette` is no longer needed here. Stylix manages all colors.
    
    # The format string is a recipe for arranging modules.
    # The first part `[$username@$hostname]` is a text group, styled together.
    format = "[[$username]($style)[@$hostname]($style)](bold base0D) [$directory]($style) $git_branch\n$character";

    # The username module's only job is to provide the name. No extra styling.
    username = {
      show_always = true;
      format = "$user"; # Just the raw data.
    };

    # The hostname module's only job is to provide the name.
    hostname = {
      ssh_only = false;
      format = "$hostname"; # Just the raw data.
    };

    # The directory module is styled with "Echoing Teal".
    directory = {
      style = "bold base0C";
      truncation_length = 3;
      truncation_symbol = "…/";
      format = "[$path]($style) ";
    };

    # The git_branch module is styled with "Twilight Plum".
    git_branch = {
      style = "bold base0E";
      symbol = "";
      format = "on [$symbol $branch]($style)";
    };

    # The character module uses your chosen sigil.
    character = {
      success_symbol = "[↯](bold base0B)"; # Verdant Fate
      error_symbol   = "[↯](bold base08)"; # Frayed Thread
    };
  };
}