{
  nixpkgs.config.allowUnfree = true;

  programs.nix-index.enable = true;

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };
}