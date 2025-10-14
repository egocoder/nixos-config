{

  programs.git = {
    enable = true;

    # --- User Identity ---
    userName = "egocoder";
    userEmail = "egocoderx@gmail.com";

    # --- Core Behavior ---
    core = {
      editor = "hx";
    };

    init = {
      defaultBranch = "main";
    };

    # --- Aliases ---
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