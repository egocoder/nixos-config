# modules/home/shells/zsh/default.nix
{
  imports = [
    ./aliases.nix
    ./history.nix
    ./options.nix
    ./plugins.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
      EDITOR = "hx";
      PAGER = "less";
    };
  };

  # --- Declarative Tool Integrations ---
  programs.fzf.enableZshIntegration = true;
  programs.zoxide.enableZshIntegration = true;
  programs.atuin.enableZshIntegration = true;
  programs.direnv.enableZshIntegration = true;
}