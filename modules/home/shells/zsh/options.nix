{
  # Defines the core behavior and keybindings of the shell.

  programs.zsh.autocd = true;

  programs.zsh.setOptions = [
    "AUTO_PUSHD"
  ];

  # Enable history substring search. This allows finding commands by
  # typing any part of them, not just the beginning.
  programs.zsh.historySubstringSearch.enable = true;

  programs.zsh.initContent = ''
    # Enable vi-mode for efficient command-line editing.
    bindkey -v
  '';
}
