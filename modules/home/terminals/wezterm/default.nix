{
  programs.wezterm.enable = true;

  imports = [
    ./behavior.nix
    ./core.nix
    ./keys.nix
    ./mouse.nix
    ./ui.nix
    ./user.nix
  ];
}
