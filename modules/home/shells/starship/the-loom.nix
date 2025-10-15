# modules/home/shells/starship/the-loom.nix
{
  # The Loom theme, with its structure preserved and colors managed by Stylix.
  programs.starship.settings = {
    # `palette` and `palettes` sections are REMOVED.

    # The format string handles all layout. Sub-modules provide only raw data.
    format = "[╭ $username@$hostname](bold base0A)\n[╰─](bold base0A) $directory$git_branch$character";

    # Sub-modules provide only their raw data for the format string to assemble.
    username = { show_always = true; format = "$user"; };
    hostname = { ssh_only = false; format = "$hostname"; };

    directory = {
      style = "bold base0C"; # Echoing Teal
      format = "[$path]($style) ";
      truncation_length = 4;
      truncation_symbol = "…/";
    };

    git_branch = {
      style = "bold base0E"; # Twilight Plum
      format = "[$symbol$branch]($style) ";
      symbol = " ";
    };

    character = {
      success_symbol = "[❯](bold base0B)"; # Verdant Fate
      error_symbol = "[❯](bold base08)";   # Frayed Thread
      vicmd_symbol = "[❮](bold base0B)";
    };
  };
}