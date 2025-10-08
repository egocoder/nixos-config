{ lib, ... }:

{
  options.gpuVendor = lib.mkOption {
    type = lib.types.enum [ "nvidia" "amd" "intel" ];
    default = "amd"; # A sensible default.
    description = "The primary GPU vendor for the system.";
  };
}