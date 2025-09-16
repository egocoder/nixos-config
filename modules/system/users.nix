{ pkgs, user, ... }:

{
  programs.zsh.enable = true;

  users.users.${user} = {
    isNormalUser = true;

    extraGroups = [ "wheel" "networkmanager" "docker" ];

    shell = pkgs.zsh;
  };

  # Automatically login on console (optional, can comment out for strict security)
  # services.getty.autologinUser = user;

  security.sudo.wheelNeedsPassword = true;
}
