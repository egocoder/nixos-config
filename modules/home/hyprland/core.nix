{ pkgs, ... }: {
  programs.hyprland.settings = {
    general = {
      layout = "dwindle";
      gaps_in = 2;
      gaps_out = 4;
      border_size = 2;
      resize_on_border = true;
    };

    input = {
      kb_layout = "br";
      kb_variant = "abnt2";
      repeat_rate = 50;
      repeat_delay = 300;
      numlock_by_default = true;

      touchpad = {
        disable_while_typing = true;
        natural_scroll = true;
        tap-to-click = true;
      };
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_fingers = 3;
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_status = "master";
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      vfr = true;
    };

    binds = {
      workspace_back_and_forth = true;
      allow_workspace_cycles = true;
    };

    xwayland.force_zero_scaling = true;
  };
}
