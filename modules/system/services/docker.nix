{ config, pkgs, ... }:

{
  # Philosophy: Simple modules. Clear meaning. Growth without chaos.
  # Enable Docker for containerized development and deployment.

  virtualisation.docker = {
    enable = true;            # Enable Docker daemon
    enableOnBoot = true;      # Start automatically on system boot
    autoPrune.enable = true;  # Clean unused containers/images automatically
  };

  # Provide Docker CLI tools globally.
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];
}
