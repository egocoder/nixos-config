# Adiciona 'config' para que possamos acessar as cores do stylix
{ config, lib, ... }:

let
  # Um atalho para o set de cores do stylix
  colors = config.lib.stylix.colors;

  # Um helper para formatar o código hexadecimal para o Starship
  hex = c: "#${c}";
in
{
  programs.starship.settings = {
    # --- FILOSOFIA: "Crescimento sem caos" ---
    # Adicionamos os módulos de linguagem. Eles só aparecerão
    # quando o Starship detectar um ambiente relevante (ex: um .nix, .rs, .py).
    format = "$username$directory $git_branch$nix_shell$rust$python$c\n$character";

    # --- Módulo: Username (Golden Thread) ---
    username = {
      show_always = true;
      style_user = "bold ${hex colors.base0A}";
      style_root = "bold ${hex colors.base08}";
      format = "[$user]($style)"; # Respeitando seu pedido
    };

    # --- Módulo: Directory (Echoing Teal) ---
    directory = {
      style = hex colors.base0C;
      truncation_length = 3;
      truncation_symbol = "…/";
      format = "[:$path]($style)";
    };

    # --- Módulo: Git branch (Twilight Plum) ---
    git_branch = {
      style = "bold ${hex colors.base0E}";
      symbol = "";
      format = "on [$symbol $branch]($style) "; # Adicionado espaço no final
    };

    # --- FILOSOFIA: "Módulos Simples" (Novos) ---
    # Cada módulo de linguagem tem uma responsabilidade clara
    # e um significado claro (símbolo + versão).

    # --- Módulo: Nix Shell (Echoing Teal) ---
    nix_shell = {
      symbol = "❄️ ";
      style = hex colors.base0C;
      format = "[$symbol$state]($style) ";
    };

    # --- Módulo: Rust (Oracle's Glimmer) ---
    rust = {
      symbol = " ";
      style = hex colors.base09;
      format = "[$symbol($version)]($style) ";
    };

    # --- Módulo: Python (Golden Thread) ---
    python = {
      symbol = " ";
      style = hex colors.base0A;
      format = "[$symbol($version)]($style) ";
    };

    # --- Módulo: C (Weaver's Indigo) ---
    c = {
      symbol = " ";
      style = hex colors.base0D;
      format = "[$symbol($version)]($style) ";
    };

    # --- Módulo: Character (Verdant/Frayed) ---
    character = {
      success_symbol = "[λ](bold ${hex colors.base0B})";
      error_symbol   = "[λ](bold ${hex colors.base08})";
    };
  };
}
