{ config, pkgs, lib, username, stateVersion, ... }:

{
  imports = [
    ./editors
    ./git
    ./hyprland
    ./packages
    ./services
    ./ssh
    ./shells
    ./terminals
    ./stylix
    ./obsidian
  ];

  config = {
    home = {
      username = username;
      homeDirectory = "/home/${username}";
      stateVersion = stateVersion;
    };
  };
}
