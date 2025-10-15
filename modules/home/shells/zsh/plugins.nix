{ pkgs, ... }:
{

  programs.zsh.plugins = [
    {
      name = "zsh-completions";
      src = pkgs.zsh-completions;
    }
  ];
}
