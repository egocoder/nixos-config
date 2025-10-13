# --- Environment Aggregator ---
# Simple modules. Clear meanings. Growth without chaos.
#
# Merges environment variables from all sub-modules.
{
  imports = [
    ./core.nix
    ./nvidia.nix
  ];
}