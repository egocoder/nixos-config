# modules/home/shells/starship/the-loom.nix
{ config, lib, ... }:

let
  colors = config.lib.stylix.colors;
  hex = c: "#${c}";
in
{
  # Este tema usa 'username' e 'hostname' como variáveis de texto,
  # então a regra do '($style)' não se aplica aqui.
  programs.starship.settings = {

    # O formato é a chave, com cores adaptadas
    format = "[╭ $username@$hostname](bold ${hex colors.base0A})\n[╰─](bold ${hex colors.base0A}) $directory$git_branch$character";

    # Módulos fornecem dados brutos
    username = { show_always = true; format = "$user"; };
    hostname = { ssh_only = false; format = "$hostname"; };

    directory = {
      style = "bold ${hex colors.base0C}"; # Echoing Teal
      format = "[$path]($style) ";
      truncation_length = 4;
      truncation_symbol = "…/";
    };

    git_branch = {
      style = "bold ${hex colors.base0E}"; # Twilight Plum
      format = "[$symbol$branch]($style) ";
      symbol = " ";
    };

    character = {
      success_symbol = "[❯](bold ${hex colors.base0B})"; # Verdant Fate
      error_symbol = "[❯](bold ${hex colors.base08})";   # Frayed Thread
      vicmd_symbol = "[❮](bold ${hex colors.base0B})";
    };
  };
}
