# modules/home/ssh/default.nix
{
  # Simple modules. Clear meanings. Growth without chaos.
  # This module configures the SSH agent for seamless, secure authentication.

  # --- GPG Agent as SSH Agent ---
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

  # --- SSH Client Configuration ---
  # Defines which keys the agent should manage.
  programs.ssh = {
    enable = true;

    # Instructs SSH to use the GPG agent we enabled above.
    # This ensures all keys are handled by one central process.
    startAgent = false;

    # Automatically add keys to the agent on first use.
    addKeysToAgent = "yes";

    # --- Key Identities ---
    # A clear list of private keys for the agent to manage.
    # Uncomment and add the paths to your keys. They are typically
    # found in ~/.ssh/.
    identitiesOnly = true; # Ensures only keys listed here are used.
    identityFiles = [
    #   "~/.ssh/id_ed25519"
    #   "~/.ssh/id_rsa"
    #   "~/.ssh/github_key"
    # ];
  };
}