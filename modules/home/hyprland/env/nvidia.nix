{ pkgs, ... }: {
  home.sessionVariables = {
    # -- NVIDIA Specific Environment Variables --
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
    GSK_RENDERER = "ngl";

    # -- Optional: enable with caution --
    GBM_BACKEND = "nvidia-drm";
    __GL_GSYNC_ALLOWED = "1";         # Adaptive VSync
    __NV_PRIME_RENDER_OFFLOAD = "1";  # Offload rendering
    __VK_LAYER_NV_optimus = "NVIDIA_only";
    WLR_DRM_NO_ATOMIC = "1";          # May be required for some setups

    # -- Optional Firefox acceleration tweaks --
    MOZ_DISABLE_RDD_SANDBOX = "1";
    EGL_PLATFORM = "wayland";
  };
}
