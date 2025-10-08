{
  wayland.windowManager.hyprland.settings = {
    # See https://wiki.hyprland.org/Configuring/Variables/#general
    general = {
      layout = "dwindle";
      gaps_in = 2;
      gaps_out = 4;
      border_size = 2;
      resize_on_border = true;
    };

    # See https://wiki.hyprland.org/Configuring/Variables/#dwindle-layout
    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    # See https://wiki.hyprland.org/Configuring/Variables/#master-layout
    master = {
      new_status = "master";
    };

    # See https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      vfr = true;
    };

    # Global bind settings (not the key combinations themselves)
    binds = {
      workspace_back_and_forth = true;
      allow_workspace_cycles = true;
    };

    # XWayland settings for compatibility
    xwayland = {
      force_zero_scaling = true;
    };
  };
}