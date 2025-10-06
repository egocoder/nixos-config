{ config, lib, ... }:

let
  # Load user-defined GPU vendor (from config.nix or host)
  gpuVendor = config.gpuVendor or "amd";
in
{
  imports =
    [
      ./core.nix      # Essential environment variables (universal)
      ./extra.nix     # Optional variables (debug, electron, etc.)
    ]
    # Conditionally include GPU-specific configurations
    ++ lib.optional (gpuVendor == "nvidia") ./nvidia.nix
    ++ lib.optional (gpuVendor == "amd") ./amd.nix
    ++ lib.optional (gpuVendor == "intel") ./intel.nix;

  # Optional: expose which GPU config is active (debug/log clarity)
  home.sessionVariables = {
    ACTIVE_GPU_VENDOR = gpuVendor;
  };
}
