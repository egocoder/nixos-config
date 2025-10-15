{

  programs.zsh.autocd = true;

  programs.zsh.setOptions = [
    # Automatically push visited directories onto the directory stack.
    "AUTO_PUSHD"
  ];

  programs.zsh.initContent = ''
    # Enable vi-mode for efficient command-line editing.
    # Provides two distinct modes: normal (for navigation) and insert (for typing).
    bindkey -v
  '';
}
