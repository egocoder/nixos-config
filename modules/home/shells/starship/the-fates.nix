# modules/home/shells/starship/the-fates.nix
{ config, lib, ... }:

let
  colors = config.lib.stylix.colors;
  hex = c: "#${c}";
in
{
  programs.starship.settings = {
    # 'palette' e 'palettes' removidas.

    # The Left Fate: Context.
    format = "$directory$git_branch\n$character";

    # The Right Fate: Status indicators.
    right_format = "$cmd_duration$time";

    directory = {
      style = "bold ${hex colors.base0C}"; # Adaptado de palette:cyan
      truncation_length = 4;
      format = "[$path]($style) ";
    };

    git_branch = {
      style = "bold ${hex colors.base0E}"; # Adaptado de palette:violet
      format = "on [$symbol$branch]($style) ";
      symbol = " ";
    };

    cmd_duration = {
      min_time = 500;
      style = "italic ${hex colors.base09}"; # Adaptado de palette:magenta
      format = "[$duration]($style) ";
    };

    time = {
      disabled = true;
      use_12hr = false;
      style = "dimmed ${hex colors.base05}"; # Adaptado de palette:base05
      format = "at [$time]($style) ";
    };

    character = {
      success_symbol = "[λ](bold ${hex colors.base0B})"; # Adaptado de palette:green
      error_symbol = "[λ](bold ${hex colors.base08})"; # Adaptado de palette:red
      vicmd_symbol = "[λ](bold ${hex colors.base0B})";
    };
  };
}
