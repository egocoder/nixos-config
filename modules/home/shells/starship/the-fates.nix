# modules/home/shells/starship/the-fates.nix
{ lib, ... }:

{
  programs.starship.settings = {
    # Simple modules. Clear meanings. Growth without chaos.
    # ...

    palette = lib.mkForce "weaver";
    palettes.weaver = {
      base05 = "#c0caf5";
      violet = "#bb9af7";
      cyan   = "#7dcfff";
      gold   = "#e0af68";
      green  = "#9ece6a";
      red    = "#db4b4b";
      magenta= "#f7768e";
    };

    # The Left Fate: Context.
    format = "$directory$git_branch\n$character";

    # The Right Fate: Status indicators.
    right_format = "$cmd_duration$time"; # <-- ADICIONADO DE VOLTA

    directory = {
    # ... resto do arquivo sem alterações
      style = "bold palette:cyan";
      truncation_length = 4;
      format = "[$path]($style) ";
    };

    git_branch = {
      style = "bold palette:violet";
      format = "on [$symbol$branch]($style) ";
      symbol = " ";
    };

    cmd_duration = {
      min_time = 500;
      style = "italic palette:magenta";
      format = "[$duration]($style) ";
    };

    time = {
      disabled = true; # Mantém desabilitado, como você pediu
      use_12hr = false;
      style = "dimmed palette:base05";
      format = "at [$time]($style) ";
    };

    character = {
      success_symbol = "[λ](bold palette:green)";
      error_symbol = "[λ](bold palette:red)";
      vicmd_symbol = "[λ](bold palette:green)"; # <-- Adicionado vicmd para consistência
    };
  };
}