{ pkgs, ... }: {
  home.packages = with pkgs; [
    bemoji
    nix-prefetch-scripts
  ];
}