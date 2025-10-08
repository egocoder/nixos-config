{
  wayland.windowManager.hyprland.settings = {
    # See https://wiki.hyprland.org/Configuring/Variables/#input
    input = {
      kb_layout = "br";
      kb_variant = "abnt2";
      repeat_rate = 50;
      repeat_delay = 300;
      numlock_by_default = true;

      touchpad = {
        disable_while_typing = true;
        natural_scroll = true;
        "tap-to-click" = true;
      };
    };

    # See https://wiki.hyprland.org/Configuring/Binds/#gestures
    # Defines gestures as a list of strings.
    gesture = [
      # Swipe workspace with 3 fingers
      "3, horizontal, workspace"
    ];
  };
}

