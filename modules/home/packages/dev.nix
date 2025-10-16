{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs
    python313   # Python for scripts and data tasks
    rustc       # Rust compiler
    cargo       # Rust package manager
  ];
}
