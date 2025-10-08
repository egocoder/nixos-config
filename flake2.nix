{
  description = "A modular, minimal and scalable NixOS configuration";

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

  outputs = inputs @ { self, nixpkgs, home-manager, stylix, nixvim, ... }:
    let
      # Import local, unversioned configuration.
      # Load main configuration, ensuring it exists.
      config =
        if builtins.pathExists ./config.nix then
          import ./config.nix
        else
          throw "ERROR: config.nix not found. Copy config.example.nix to config.nix and fill it.";

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
          inherit stateVersion;
        }
      ];

      makeSystem = { hostname, user, stateVersion }:
        nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = { inherit inputs user hostname stateVersion; };

          modules = [
            ./modules/system/default.nix
            stylix.nixosModules.stylix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit user inputs; };
              home-manager.users.${user}.imports = homeModules;
            }

            ./hosts/${hostname}/configuration.nix
          ];
        };

    in {
      # --- Outputs ---
      # Build all NixOS configurations defined in 'hosts'.
      # Access with `nixos-rebuild switch --flake .#hostname`
      nixosConfigurations = builtins.listToAttrs (
        map (host: { name = host.hostname; value = makeSystem host; }) hosts
      );

      # A standalone home-manager configuration.
      # Useful for applying dotfiles on non-NixOS systems.
      # Build with: home-manager switch --flake .#<username>
      homeConfigurations."${config.username}" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit inputs; user = config.username; };
          modules = homeModules;
        };
    };
}