{ pkgs, username, ... }:

{
  programs.zsh.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "kvm" ];
    shell = pkgs.zsh; # ou pkgs.nushell, se quiser usar Nushell como padrão
  };

  security.sudo-rs.wheelNeedsPassword = true;

  security.sudo-rs.enable = true;
}
