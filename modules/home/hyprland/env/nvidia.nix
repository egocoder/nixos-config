{ config, lib, pkgs, gpuVendor, ... }:

# Corrected: Checks the 'gpuVendor' variable directly, not config.gpuVendor.
lib.mkIf (gpuVendor == "nvidia") {
  home.sessionVariables = {
    # -- NVIDIA Specific Environment Variables --
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
    GSK_RENDERER = "ngl";

    # -- Optional: enable with caution --
    GBM_BACKEND = "nvidia-drm";
    __GL_GSYNC_ALLOWED = "1";
    __NV_PRIME_RENDER_OFFLOAD = "1";
    __VK_LAYER_NV_optimus = "NVIDIA_only";
    WLR_DRM_NO_ATOMIC = "1";

    # -- Optional Firefox acceleration tweaks --
    MOZ_DISABLE_RDD_SANDBOX = "1";
    EGL_PLATFORM = "wayland";
  };
}