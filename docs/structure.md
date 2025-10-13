# Directory Structure

nixos-config
├── config.example.nix
├── docs
│   ├── contributing.md
│   ├── philosophy.md
│   └── structure.md
├── flake.nix
├── hosts
│   ├── hubris
│   │   ├── configuration.nix
│   │   └── local.nix
│   └── loom
│       ├── configuration.nix
│       └── local.nix
└── modules
    ├── home
    └── system


- `flake.nix`: main flake for NixOS + Home Manager
- `config.example.nix`: template for local configuration
- `hosts/`: host-specific NixOS configs
- `modules/`: reusable system & home modules
- `docs/`: documentation
