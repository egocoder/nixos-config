{ config, pkgs, lib, username, stateVersion, ... }:

{
  imports = [
    ./git
    ./hyprland
    ./packages
    ./ide
    ./ssh
    ./shells
    ./terminals
    ./stylix
  ];

  config = {
    home = {
      username = username;
      homeDirectory = "/home/${username}";
      stateVersion = stateVersion;
    };
  };
}
