{ ... }: {
  programs.zsh.shellAliases =
    let
      flakeDir = "~/flake";
    in {
      # System management
      sw = "nh os switch";
      upd = "nh os switch --update";
      hms = "nh home switch";

      # Quick access
      pkgs = "nvim ${flakeDir}/nixos/packages.nix";

      # Replacements
      y = "yazi";
      v = "nvim";
      se = "sudoedit";
      microfetch = "microfetch && echo";

      # Git workflow
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";

      # Navigation
      ".." = "cd ..";
    };
}
