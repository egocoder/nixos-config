# modules/home/git/git.nix
{
  programs.git = {
    enable = true;

    # --- User Identity ---
    userName = "egocoder";
    userEmail = "egocoderx@gmail.com";

    # --- Custom Git Settings ---
    # FIX: `extraConfig` must be a nested set, mirroring the .gitconfig structure.
    # This makes the meaning clear: `init.defaultBranch` is under the `[init]` section.
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      core = {
        editor = "hx";
      };
    };

    # --- Aliases ---
    aliases = {
      co = "checkout";
      br = "branch";
      st = "status";
      unstage = "reset HEAD --";
      last = "log -1 HEAD";
    };
  };
}