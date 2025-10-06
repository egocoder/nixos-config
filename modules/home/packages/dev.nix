{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs
    python311
    rustc
    cargo
  ];
}
