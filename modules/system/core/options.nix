{ lib, ... }:

{
  
  # Define a system-wide GPU vendor option
  options.gpuVendor = lib.mkOption {
    type = lib.types.enum [ "nvidia" "amd" "intel" ];
    default = "amd";                  # Sensible default
    description = "The primary GPU vendor for the system.";
  };
}
