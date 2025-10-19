{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # --- Variables ---
    "$mainMod" = "SUPER";
    "$term" = "wezterm";
    "$files" = "$term -e sh -c 'yazi'";
    "$menu" = "sh -c 'wofi --show drun'";
    "$editor" = "$term -e sh -c 'hx'";

    # --- General ---
    # Defines the core layout and spacing.
    general = {
      layout = "dwindle";
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      resize_on_border = true;
    };

    # --- Decoration ---
    # Manages window appearance like opacity and blur.
    # Colors are handled by `colors.nix`.
    decoration = {
      active_opacity = 1.0;
      inactive_opacity = 0.9;
      fullscreen_opacity = 1.0;
      rounding = 8; # A moderate rounding for a softer look.
      blur = {
        enabled = true;
        size = 6;
        passes = 3;
        new_optimizations = true;
        ignore_opacity = true;
      };

      shadow = {
        enabled = true;
        range = 12;
        render_power = 3;
        offset = "0 2";
      };


      dim_inactive = true;
      dim_strength = 0.1;
    };

    # --- Layouts ---
    # Fine-tunes the behavior of specific layouts.
    dwindle = {
      pseudotile = true;
      preserve_split = true;
      special_scale_factor = 1;
    };

    master = {
      new_status = "master";
      new_on_top = 1;
      mfact = 0.5;
    };

    # --- Input ---
    # Configures keyboard, mouse, and touchpad behavior.
    input = {
      kb_layout = "br";
      kb_variant = "abnt2";
      repeat_rate = 50;
      repeat_delay = 300;
      numlock_by_default = true;
      follow_mouse = 1;
      touchpad = {
        disable_while_typing = true;
        natural_scroll = true;
        "tap-to-click" = true;
      };
      sensitivity = 0;
    };

    # --- Gestures ---
    # Defines touchpad swipe behaviors.
    gestures = {
      workspace_swipe_distance = 300;
      workspace_swipe_invert = true;
      workspace_swipe_create_new = true;
    };
    gesture = [
      "3, horizontal, workspace" # Three-finger horizontal swipe changes workspace.
    ];

    # --- Miscellaneous ---
    # Various system and behavior tweaks.
    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      vfr = true;
      enable_swallow = true;
      swallow_regex = "^(wezterm|alacritty)$";
    };

    # --- Binds Behavior ---
    # Controls how keybinds for workspaces function.
    binds = {
      workspace_back_and_forth = true;
      allow_workspace_cycles = true;
    };

    # --- XWayland ---
    # Ensures compatibility for X11 applications.
    xwayland.force_zero_scaling = true;
  };
}
