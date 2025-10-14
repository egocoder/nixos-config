{

  programs.git = {
    enable = true;

    # --- User Identity ---
    userName = "egocoder";
    userEmail = "egocoderx@gmail.com";

    # --- Core Behavior ---
    # Defines default behaviors to align with modern development standards.
    core = {
      editor = "hx";
    };

    init = {
      defaultBranch = "main";
    };

    # --- Aliases ---
    # Short, memorable commands for frequent Git operations.
    # This allows for a faster workflow without shell-level complexity.
    aliases = {
      co = "checkout";
      br = "branch";
      st = "status";
      unstage = "reset HEAD --";
      last = "log -1 HEAD";
    };

    # --- GPG Signing (Optional) ---
    # For verifiable, trusted commits. Growth without chaos: enable this
    # when you have a GPG key ready by uncommenting the lines below.
    # signing = {
    #   key = "YOUR_GPG_KEY_ID"; # Replace with your GPG key ID
    #   signByDefault = true;
    # };
  };
}