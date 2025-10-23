{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "egocoder";
        email = "egocoderx@gmail.com";
      };

      # Core Behavior (was programs.git.extraConfig.core)
      core = {
        editor = "hx";
      };

      # Init Behavior (was programs.git.extraConfig.init)
      init = {
        defaultBranch = "main";
      };

      # Aliases (was programs.git.aliases)
      alias = {
        co = "checkout";
        br = "branch";
        st = "status";
        unstage = "reset HEAD --";
        last = "log -1 HEAD";
      };

      # --- Growth Without Chaos ---
      # You can easily add new settings blocks here, like GPG signing,
      # without changing the structure.
      #
      # Example:
      # gpg = {
      #   format = "ssh";
      # };
      # commit = {
      #   gpgSign = true;
      # };
    };
  };
}
