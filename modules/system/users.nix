{ pkgs, user, ... }:

{
  programs.zsh.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "kvm" ];
    shell = pkgs.zsh;

    # Set the initial password for the user account.
    # On first login, you will be prompted to change it.
    # An empty string means no password is required for the first login.
  };

  security.sudo.wheelNeedsPassword = true;
}
