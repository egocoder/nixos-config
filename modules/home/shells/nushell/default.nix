{
  imports = [
    ./aliases.nix
    ./config.nix
    ../starship # <-- Points to the new shared starship theme selector
  ];

  programs.nushell = {
    enable = true;
  };
}