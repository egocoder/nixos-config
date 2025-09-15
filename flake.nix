{
  description = "A minimal, modular, and portable NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, stylix, nixvim, ... }:
    let
      # Import local, unversioned configuration.
      # This check provides a user-friendly error if the file doesn't exist.
      config =
        if builtins.pathExists ./config.nix
        then import ./config.nix
        else throw "ERROR: config.nix not found. Please copy config.example.nix to config.nix and fill it out.";

      system = "x86_64-linux";
      stateVersion = "25.05";

      homeModules = [
        ./modules/home/default.nix
        stylix.homeModules.stylix
        nixvim.homeModules.nixvim
      ];

      hosts = [
        {
          hostname = config.hostname;
          user = config.username;
          stateVersion = stateVersion;
        }
      ];

      makeSystem = { hostname, stateVersion, user }: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs user hostname stateVersion; };
        modules = [
          ./modules/system/default.nix

          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              # Pass username from config.nix
              user = config.username;
              inherit inputs;
            };
            # Integrate the user's home configuration directly into the system build.
            home-manager.users.${config.username} = { imports = homeModules; };

            system.stateVersion = stateVersion;
          }

          # Host-specific configuration
          ./hosts/${hostname}/configuration.nix
        ];
      };
    in
    {
      # --- NixOS System Outputs ---
      # Build with: sudo nixos-rebuild switch --flake .#<hostname>
      nixosConfigurations = builtins.listToAttrs (
        map (host: {
          name = host.hostname;
          value = makeSystem host;
        }) hosts
      );

      # --- Home Manager Standalone Outputs ---
      # For managing user environments on non-NixOS systems.
      # Build with: home-manager switch --flake .#<username>
      homeConfigurations."${config.username}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          user = config.username;
          inherit inputs;
        };
        modules = homeModules;
      };
    };
}
