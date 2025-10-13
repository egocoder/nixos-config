{ config, ... }:

{
  programs.zsh.history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
    share = true; # Share history between all shell sessions
    ignoreDups = true;
    ignoreAllDups = true;
  };
}