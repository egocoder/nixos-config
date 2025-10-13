# --- flake.nix ---
# Philosophy: Simple modules. Clear meanings. Growth without chaos.
# This flake supports both an integrated NixOS system build and a
# standalone Home Manager configuration for portability.
{
  description = "A modular, minimal, and scalable NixOS configuration by Weaver.";

  inputs = {
    nixpkgs.url      = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url       = "github:danth/stylix";
    nixvim.url       = "github:nix-community/nixvim";
    nur.url          = "github:nix-community/NUR";
    hyprland.url     = "github:hyprwm/Hyprland";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, stylix, hyprland, nur, ... }:
    let
      system       = "x86_64-linux";
      stateVersion = "25.05";
      config = if builtins.pathExists ./config.nix
        then import ./config.nix
        else throw "ERROR: config.nix not found.";

      # --- Shared Home Manager Configuration ---
      # This is the single source of truth for the user's home environment.
      # It is used by both the NixOS system and the standalone home configuration.
      homeManagerModules = [
        # Import all home modules.
        ./modules/home/default.nix
        # Import Stylix home module.
        stylix.homeModules.stylix
        # Apply NUR overlay and allow unfree packages for home-manager.
        {
          nixpkgs.overlays = [ nur.overlays.default ];
          nixpkgs.config.allowUnfree = true;
          home.stateVersion = stateVersion;
        }
      ];

    in
    {
      # --- NixOS System Configuration (Integrated Home Manager) ---
      # To build this: `sudo nixos-rebuild switch --flake .#loom`
      nixosConfigurations.loom = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs stateVersion;
          inherit (config) hostname username gpuVendor;
        };
        modules = [
          # System modules
          ./modules/system/default.nix
          ./hosts/${config.hostname}/configuration.nix

          # Flake modules
          stylix.nixosModules.stylix
          nur.modules.nixos.default

          # Home Manager integration module for NixOS
          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs stateVersion;
              inherit (config) username gpuVendor;
            };
            home-manager.users.${config.username} = {
              # Reuse the shared home configuration.
              imports = homeManagerModules;
            };
          }

          # Hyprland package from flake input
          {
            programs.hyprland.package = hyprland.packages.${system}.hyprland;
            programs.hyprland.portalPackage = hyprland.packages.${system}.xdg-desktop-portal-hyprland;
            hardware.graphics.package = hyprland.inputs.nixpkgs.legacyPackages.${system}.mesa;
            hardware.graphics.package32 = hyprland.inputs.nixpkgs.legacyPackages.${system}.pkgsi686Linux.mesa;
          }
        ];
      };

      # --- Home Manager Standalone Configuration ---
      # To build this: `home-manager switch --flake .#weaver`
      homeConfigurations.weaver = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs stateVersion;
          inherit (config) username gpuVendor;
        };
        # Reuse the same shared home configuration.
        modules = homeManagerModules;
      };
    };
}