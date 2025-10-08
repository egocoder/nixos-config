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

            # --- BLOCO CORRIGIDO ---
            # 1. Habilita o módulo do Home Manager para NixOS.
            home-manager.nixosModules.home-manager # Vírgula removida

            # 2. Configura o Home Manager.
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${user}.imports = homeModules;
              };
            } # Vírgula removida

            # 3. Passa valores do 'config' do NixOS para o Home Manager.
            ({ config, ... }: {
              home-manager.extraSpecialArgs = {
                gpuVendor = config.gpuVendor;
                inherit inputs user;
              };
            }) # Vírgula removida
            # --- FIM DO BLOCO CORRIGIDO ---

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
          extraSpecialArgs = {
            inherit inputs;
            user = config.username;
            gpuVendor = config.gpuVendor;
          };
          modules = homeModules;
        };
    };
}