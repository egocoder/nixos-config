{ config, pkgs, lib, ... }:

let
  # Edit this single value to match your machine.
  # Options: "nvidia" | "amd" | "intel"
  gpuVendor = "nvidia";
in
{
  # --- Common graphics stack (works for Wayland & XWayland) ---
  # Use minimal explicit flags so it's easy to reason about.
  hardware.opengl.enable = true;        # Enable OpenGL support
  hardware.opengl.enable32Bit = true;   # 32-bit libs for Steam/Wine if needed

  # Common extra packages used by modern setups (Vulkan, VA-API, helpers).
  hardware.opengl.extraPackages = with pkgs; [
    vulkan-loader
    libva
    vulkan-validation-layers
  ] ++ lib.optional (gpuVendor == "nvidia") pkgs.nvidia_x11;

  # --- Video drivers (useful for X or hybrid setups) ---
  # Keep this list explicit and small; Wayland compositors usually ignore it,
  # but it helps when an X fallback is required or for some NV setups.
  services.xserver.videoDrivers = lib.concatLists
    [ (lib.optional (gpuVendor == "intel") [ "modesetting" ])
      (lib.optional (gpuVendor == "amd")   [ "amdgpu" ])
      (lib.optional (gpuVendor == "nvidia") [ "nvidia" ])
    ];

  # --- NVIDIA-specific minimal tweaks (only added if vendor == "nvidia") ---
  # optionalAttrs ensures we don't overwrite defaults for other vendors.
  hardware.nvidia = lib.optionalAttrs (gpuVendor == "nvidia") {
    # enable kernel modesetting path that improves Wayland support for some setups
    modesetting.enable = true;

    # use the nvidia package from nixpkgs; pkgs.nvidia_x11 is usually the correct
    # single-package entry for the proprietary X/Wayland driver.
    package = pkgs.nvidia_x11;

    # If you later need CUDA or extra components, add them here.
    # For example: extraPackages = [ pkgs.cudatoolkit ];
  };

  # Small note: if you use Hyprland on NVIDIA you may still rely on XWayland
  # for some apps. Keep xwayland enabled in your compositor unless you tested
  # a pure Wayland workflow for all apps.
}
