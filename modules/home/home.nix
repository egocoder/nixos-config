{ config, pkgs, lib, username, stateVersion, ... }:

{
  imports = [
    ./hyprland
    ./packages
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
