# modules/home/shells/starship/the-pattern.nix
{ lib, ...}:

{
  programs.starship.settings = {
    # Simple modules. Clear meanings. Growth without chaos.
    # This theme uses a repeating separator to create a clear, rhythmic pattern.
    
    # Define a custom separator symbol.
    custom.separator = {
        format = " | ";
        style = "dimmed";
        when = true;
    };

    # The pattern is built by chaining modules and separators.
    format = "$username$custom.separator$directory$custom.separator$git_branch$character";
    
    palette = lib.mkForce "weaver";
    palettes.weaver = {
      violet = "#bb9af7";
      cyan   = "#7dcfff";
      gold   = "#e0af68";
      green  = "#9ece6a";
      red    = "#db4b4b";
    };

    # User module, the start of the pattern.
    username = {
      show_always = true;
      style_user = "bold palette:gold";
      format = "[$user]($style)";
    };

    # Directory module.
    directory = {
      style = "bold palette:cyan";
      truncation_length = 3;
      format = "[$path]($style)";
    };

    # Git branch module.
    git_branch = {
      style = "bold palette:violet";
      format = "[$symbol$branch]($style)";
      symbol = "";
    };

    # The character breaks the pattern and signals readiness.
    character = {
      success_symbol = "\n[->](bold palette:green)";
      error_symbol = "\n[->](bold palette:red)";
    };
  };
}