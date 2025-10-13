# modules/home/shells/starship/the-minimal-pattern.nix (Novo Arquivo Sugerido)
{ lib, ...}:
{
  programs.starship.settings = {
    # Combina o minimalismo do Scryer com os separadores do Pattern.
    palette = lib.mkForce "weaver";
    palettes.weaver = {
      violet = "#bb9af7"; cyan = "#7dcfff"; gold = "#e0af68";
      green  = "#9ece6a"; red  = "#db4b4b";
    };

    # Formato linear com separador personalizado.
    format = "$directory$git_branch$character";

    directory = {
      style = "bold palette:cyan";
      truncation_length = 3;
      format = "[$path]($style)";
    };
    git_branch = {
      style = "bold palette:violet";
      # Usa o separador ✴ como no seu exemplo.
      format = " on [$symbol$branch]($style) ";
      symbol = "";
    };
    character = {
      success_symbol = "[✴](bold palette:green)";
      error_symbol = "[✴](bold palette:red)";
    };
  };
}