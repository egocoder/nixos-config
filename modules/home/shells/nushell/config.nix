{
  programs.nushell = {
    # Environment variables are set declaratively.
    environmentVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };

    # Core behavior settings.
    settings = {
      show_banner = false;
      table_mode = "rounded";
      edit_mode = "vi";
      history.max_size = 10000;
    };

    # The `starship init` command is no longer needed here.
    # `enableNushellIntegration` handles it automatically.
    extraConfig = "";
  };

  # Let Home Manager modules handle their respective integrations declaratively.
  programs.starship.enableNushellIntegration = true;
  programs.zoxide.enableNushellIntegration = true;
  programs.direnv.enableNushellIntegration = true;
  programs.yazi.enableNushellIntegration = true;
  programs.eza.enableNushellIntegration = true;
  programs.atuin.enableNushellIntegration = true;
}