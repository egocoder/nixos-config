# modules/home/ssh/ssh.nix
{
  # Simple modules. Clear meanings. Growth without chaos.
  # This module configures the SSH agent and client for seamless, secure authentication.

  # --- GPG Agent as SSH Agent ---
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

  # --- SSH Client Configuration ---
  programs.ssh = {
    enableDefaultConfig = true;

    matchBlocks = {
      "all-hosts" = {
        host = "*";
        addKeysToAgent = "yes";
        identitiesOnly = true;

        # FIX: The correct option name is `identityFile` (singular), even
        # though it accepts a list of files. This matches the Home Manager API.
        identityFile = [
          # Add your key paths here, for example:
          "~/.ssh/id_ed25519"
        ];
      };
    };
  };
}