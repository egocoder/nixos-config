{ config, pkgs, lib, username, stateVersion, ... }:

{
  imports = [
    ./git
    ./hyprland
    ./packages
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
