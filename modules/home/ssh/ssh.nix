# modules/home/ssh/ssh.nix
{
  # Simple modules. Clear meanings. Growth without chaos.
  # This module configures the SSH agent for seamless, secure authentication.

  # --- GPG Agent as SSH Agent ---
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

  # --- SSH Client Configuration ---
  programs.ssh = {
    enable = true;
    startAgent = false;
    addKeysToAgent = "yes";

    # --- Key Identities ---
    # This list is intentionally empty until you add your own keys.
    # An empty list `[]` is a valid and clear configuration state.
    identitiesOnly = true;
    identityFiles = [
      # Add your key paths here, for example:
      # "~/.ssh/id_ed25519"
    ]; # FIX: This closing bracket must not be commented out.
  };
}