{ pkgs, lib, ... }:

{

  nix = {
    enable = true;
    package = lib.mkDefault pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}