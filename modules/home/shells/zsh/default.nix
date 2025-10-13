{
  imports = [
    ./aliases.nix
    ./history.nix
    ../starship # <-- Points to the new shared starship theme selector
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true; # For better terminal integration
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Declarative session variables are cleaner than exporting in initContent.
    sessionVariables = {
      EDITOR = "hx";
      PAGER = "less";
    };

    # Let the starship module handle its own initialization.
    initExtra = "";
  };
}