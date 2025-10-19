{

  programs.starship.settings = {

    format =  "$username:$directory $git_branch\n$character";

    # Username uses "Golden Thread".
    username = {
      show_always = true;
      style_user = "base0A";
      format = "[$user]($style_user)";
    };

    # Directory uses "Echoing Teal" and is truncated.
    directory = {
      style = "base0C";
      truncation_length = 1;
      truncation_symbol = "…/";
      home_symbol = "~";
      format = "[$path]($style)";
    };

    # Hostname uses "Weaver's Indigo".
    hostname = {
      ssh_only = false;
      style = "base0D";
      format = "[$hostname]($style)"; # Removido o espaço extra
    };

    # Git branch uses "Twilight Plum".
    git_branch = {
      style = "base0E";
      symbol = "";
      format = "[$symbol $branch]($style)";
    };

    # Character uses "Verdant Fate" and "Frayed Thread".
    character = {
      success_symbol = "[λ](bold base0B)";
      error_symbol   = "[λ](bold base08)";
    };
  };
}
