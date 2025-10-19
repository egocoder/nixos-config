# Adicionamos 'config' para que possamos acessar
# a biblioteca de cores do Stylix.
{ config, lib, ... }:

let
  # 1. Acessamos o 'attrset' de cores que você encontrou na documentação.
  colors = config.lib.stylix.colors;

  # 2. Criamos um 'helper' para adicionar o '#' que o Starship exige.
  hex = c: "#${c}";
in
{
  programs.starship.settings = {
    # O layout (format) permanece o seu.
    format = "$username$directory$git_branch\n$character";

    # Username usa "Golden Thread".
    username = {
      show_always = true;

      # 3. Usamos as cores do Stylix diretamente.
      style_user = hex colors.base0A; # Golden Thread
      style_root = "bold ${hex colors.base08}"; # Frayed Thread (Vermelho p/ root)

      # Corrigido para usar a variável correta
      format = "[$user]($style)";
    };

    # Directory usa "Echoing Teal".
    directory = {
      style = hex colors.base0C; # Echoing Teal
      truncation_length = 3;
      truncation_symbol = "…/";
      format = "[:$path]($style)";
    };

    # Git branch usa "Weaver's Indigo".
    git_branch = {
      style = "bold ${hex colors.base0D}"; # Weaver's Indigo
      symbol = "";
      format = "on [$symbol $branch]($style)";
    };

    # Character usa "Verdant Fate" e "Frayed Thread".
    character = {
      success_symbol = "[λ](bold ${hex colors.base0B})"; # Verdant Fate
      error_symbol   = "[λ](bold ${hex colors.base08})"; # Frayed Thread
    };
  };
}
