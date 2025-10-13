{ lib, ... }:

{
  programs.starship.settings = {
    # Simple modules. Clear meanings. Growth without chaos.
    # The Veil conceals excess — only essence remains.

    palette = lib.mkForce "weaver-destiny";
    palettes.weaver-destiny = {
      base00 = "#101116"; # Abyss Black
      base01 = "#181920"; # Shadow Steel
      base02 = "#24252D"; # Loom's Frame
      base03 = "#3A3C47"; # Faded Memory
      base04 = "#9DA2B3"; # Thread Gray
      base05 = "#D5D8E2"; # Soul Ash
      base06 = "#E3E6F0"; # Fate's Glow
      base07 = "#F2F3F7"; # Silk White
      base08 = "#C77E8C"; # Frayed Thread
      base09 = "#D9A67D"; # Oracle's Glimmer
      base0A = "#E1C48B"; # Golden Thread
      base0B = "#9EC19F"; # Verdant Fate
      base0C = "#90B6B4"; # Echoing Teal
      base0D = "#8299C5"; # Weaver's Indigo
      base0E = "#A995C0"; # Twilight Plum
      base0F = "#6A6D7D"; # Stone of Truth
    };

    # the prompt layout — clean and direct.
    format = "[$username:$directory]($style) $git_branch\n$character";

    # username — remove duplication (@@)
    username = {
      show_always = true;
      style_user = "bold palette:base0A"; # Golden Thread
      format = "[$user]($style_user)";
    };

    # hostname — no '@' symbol; keep just the name
    hostname = {
      ssh_only = false;
      style = "bold palette:base0A";
      format = "[$hostname]($style)";
      disabled = false;
    };

    directory = {
      style = "bold palette:base0C"; # Echoing Teal
      truncation_length = 3;
      truncation_symbol = "…/";
      format = "[$path]($style)";
    };

    git_branch = {
      style = "bold palette:base0D"; # Weaver’s Indigo
      symbol = "";
      format = "[$symbol $branch]($style)";
    };

    character = {
      success_symbol = "[λ](bold palette:base0B)"; # Verdant Fate
      error_symbol   = "[λ](bold palette:base08)"; # Frayed Thread
    };
  };
}
