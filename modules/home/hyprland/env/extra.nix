{ pkgs, ... }: {
  home.sessionVariables = {
    # -- Aquamarine (Hyprland > 0.45) --
    # AQ_TRACE = "1";
    # AQ_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
    # AQ_MGPU_NO_EXPLICIT = "1";
    # AQ_NO_MODIFIERS = "1";

    # -- Debug Options --
    # HYPRLAND_TRACE = "1";
    # HYPRLAND_NO_RT = "1";
    # HYPRLAND_NO_SD_NOTIFY = "1";
    # HYPRLAND_NO_SD_VARS = "1";
  };
}
