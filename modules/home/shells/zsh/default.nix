{
  imports = [
    ./aliases.nix
    ./history.nix
    #./init.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
}
