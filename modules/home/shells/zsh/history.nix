{ config, ... }: {
  programs.zsh.history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };
}

