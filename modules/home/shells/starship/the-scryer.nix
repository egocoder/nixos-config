# modules/home/shells/starship/the-scryer.nix
{ lib, ... }: # <-- ADICIONADO

{
  programs.starship.settings = {
    # Simple modules. Clear meanings. Growth without chaos.
    # This theme is minimal, showing only what is immediately relevant.
    # It reveals details only when they demand attention.

    add_newline = true;

    palette = lib.mkForce "weaver"; # <-- ADICIONADO
    palettes.weaver = {
      violet = "#bb9af7";
      cyan   = "#7dcfff";
      magenta= "#f7768e";
      green  = "#9ece6a";
      red    = "#db4b4b";
    };

    # The format is a simple sequence. Context grows as needed.
    format = "$directory$git_branch$nix_shell$cmd_duration$character";

    # Directory is the core context.
    directory = {
      style = "bold palette:cyan";
      truncation_length = 3;
      truncation_symbol = "…/";
      read_only = " 🔒";
      format = "[$path]($style)[$read_only]($style) ";
    };

    # Git appears only when inside a repository.
    git_branch = {
      style = "bold palette:violet";
      format = "([$symbol$branch]($style)) ";
      symbol = " ";
    };

    # Nix shell indicator only appears when active. Growth without chaos.
    nix_shell = {
        symbol = "❄️ ";
        style = "bold palette:cyan";
        format = "[$symbol$state]($style) ";
    };

    # Command duration is only shown if it exceeds a threshold. Clear meaning.
    cmd_duration = {
      min_time = 1000; # 1 second
      style = "italic palette:magenta";
      format = "took [$duration]($style) ";
    };

    # The character signals the state. A simple, clear glyph.
    character = {
      success_symbol = "[»](bold palette:green)";
      error_symbol = "[»](bold palette:red)";
      vicmd_symbol = "[«](bold palette:green)";
    };
  };
}