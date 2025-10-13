{
  programs.nushell.shellAliases = {
    # System management
    sw = "sudo nixos-rebuild switch --flake ~/nixos-config";
    upd = "sudo nixos-rebuild switch --flake ~/nixos-config --upgrade";
    hms = "home-manager switch --flake ~/nixos-config#weaver";

    # Replacements
    ls = "eza --icons";
    cat = "bat";
    y = "yazi";
    v = "nvim";
    se = "sudoedit";

    # Git workflow
    gs = "git status";
    ga = "git add";
    gc = "git commit";
    gp = "git push";

    # Navigation
    ".." = "cd ..";
  };
}