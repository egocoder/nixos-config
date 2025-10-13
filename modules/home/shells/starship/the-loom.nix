# modules/home/shells/starship/the-loom.nix
{ lib, ... }:

{
  programs.starship.settings = {
    # Simple modules. Clear meanings. Growth without chaos.
    # This theme weaves prompt segments into a single, unbroken thread.

    # Defines the color palette for the Loom.
    # Centralized colors prevent chaotic visual changes.
    # We use lib.mkForce to ensure this palette overrides any other definitions (e.g., from stylix).
    palette = lib.mkForce "weaver";
    palettes.weaver = {
      base03 = "#3b4261";
      base05 = "#c0caf5";
      violet = "#bb9af7";
      cyan   = "#7dcfff";
      gold   = "#e0af68";
      green  = "#9ece6a";
      red    = "#db4b4b";
    };

    # The format is a multi-line string.
    # It must be opened and closed with two single quotes ('').
    format = ''
      ╭[ $username$hostname]($style)
      ╰─ $directory$git_branch$character''; # <-- CORRIGIDO

    username = {
      show_always = true;
      style_user = "bold palette:gold";
      style_root = "bold palette:red";
      format = "[$user]($style_user)";
    };
    hostname = {
      ssh_only = false;
      style = "bold palette:gold";
      format = "[@$hostname]($style)";
      disabled = false;
    };
    
    directory = {
      style = "bold palette:cyan";
      truncation_length = 4;
      truncation_symbol = "…/";
      format = "[$path]($style) ";
    };

    git_branch = {
      style = "bold palette:violet";
      format = "[$symbol$branch]($style) ";
      symbol = " ";
    };
    
    character = {
      success_symbol = "[❯](bold palette:green)";
      error_symbol = "[❯](bold palette:red)";
      vicmd_symbol = "[❮](bold palette:green)";
    };
  };
}