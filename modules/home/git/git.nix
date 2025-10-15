# modules/home/git/git.nix
{
  programs.git = {
    enable = true;

    # --- User Identity ---
    userName = "egocoder";
    userEmail = "egocoderx@gmail.com";

    # --- Core Behavior ---
    # Defines default behaviors to align with modern development standards.
    init = {
      defaultBranch = "main";
    };

    # FIX: Use `extraConfig` for arbitrary git settings like `core.editor`.
    # The key "core.editor" directly maps to the `git config` command,
    # making the meaning clear and the module structure correct.
    extraConfig = {
      "core.editor" = "hx";
    };

    # --- Aliases ---
    # Short, memorable commands for frequent Git operations.
    aliases = {
      co = "checkout";
      br = "branch";
      st = "status";
      unstage = "reset HEAD --";
      last = "log -1 HEAD";
    };
  };
}