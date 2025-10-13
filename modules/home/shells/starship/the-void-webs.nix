# modules/home/shells/starship/the-void-webs.nix
{ lib, ... }:
{
  programs.starship.settings = {
    # ... (comentários e paleta)
    palette = lib.mkForce "weaver";
    palettes.weaver = {
      base03 = "#3b4261"; base05 = "#c0caf5"; violet = "#bb9af7";
      cyan   = "#7dcfff"; gold   = "#e0af68"; green  = "#9ece6a";
      red    = "#db4b4b";
    };

    # Formato refeito para ser mais compacto
    format = "[$username]($style)[@$hostname]($style) [$directory]($style) {$git_branch}$character";

    username = {
      show_always = true;
      style_user = "dimmed palette:gold";
      format = "[$user]($style)";
    };
    hostname = {
      ssh_only = false;
      style = "dimmed palette:gold";
      format = "[$hostname]($style)";
      disabled = false;
    };
    directory = {
      style = "bold palette:cyan";
      truncation_length = 2;
      truncation_symbol = "…";
      format = "[$path]($style)";
    };
    git_branch = {
      style = "bold palette:violet";
      format = "[$symbol$branch]($style)";
      symbol = "";
    };
    character = {
      success_symbol = " [›](palette:green)";
      error_symbol = " [›](palette:red)";
      vicmd_symbol = " [‹](palette:green)";
    };
  };
}