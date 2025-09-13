{
  description = "My minimal, modular NixOS configuration";

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
      system = "x86_64-linux";
      user = "ego";

      hosts = [
        {
          hostname = "hubris";
          stateVersion = "25.05";
        }
        # Add new host here
      ];

      makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs user hostname stateVersion;
        };

        modules = [
          ./hosts/${hostname}/configuration.nix
          ./modules/system/default.nix
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
        ];
      };
    in
    {
      nixosConfigurations = builtins.listToAttrs (
        map (host: {
          name = host.hostname;
          value = makeSystem host;
        }) hosts
      );

      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};

        extraSpecialArgs = {
          inherit inputs user;
          homeStateVersion = "25.05";
        };

        modules = [
          ./modules/home/default.nix
          stylix.homeModules.stylix
          nixvim.homeModules.nixvim
        ];
      };
    };
}
