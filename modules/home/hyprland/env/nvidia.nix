# --- NVIDIA Environment Variables ---
# These settings are applied only when the GPU vendor is set to "nvidia".
{ lib, gpuVendor, ... }:
lib.mkIf (gpuVendor == "nvidia") {
  home.sessionVariables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}