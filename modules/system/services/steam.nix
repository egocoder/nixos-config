{ pkgs, ... }:

{
  programs.steam = {
    enable = true;

    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    protontricks.enable = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
      winetricks
    ];

    gamescopeSession.enable = false;
  };

  environment.systemPackages = with pkgs; [
    steam-run           # Run Linux games in Steam runtime
    lutris              # Game manager for Epic, GOG, and others
    heroic              # Epic Games Launcher (native)
    bottles             # Wine environment manager
    mangohud            # Performance overlay
    gamescope           # Optional compositor for better latency
    wineWowPackages.wayland
  ];

  # --- Hardware Support ---
  # Enables game controllers and Steam-compatible devices.
  hardware.steam-hardware.enable = true;
}
