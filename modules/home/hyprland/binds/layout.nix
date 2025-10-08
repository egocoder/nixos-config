{
  bind = [
    # Close/kill windows
    "$mainMod, Q, killactive,"
    "$mainMod SHIFT, Q, exec, hyprctl kill" # Kills the client process

    # Toggle window states
    "$mainMod, SPACE, togglefloating,"
    "$mainMod SHIFT, F, fullscreen"

    # Layout management
    "$mainMod, P, pseudo," # Dwindle pseudo-layout
    "$mainMod, J, togglesplit," # Dwindle split ratio
  ];

  binde = [
    # Resize windows
    "$mainMod SHIFT, left, resizeactive, -50 0"
    "$mainMod SHIFT, right, resizeactive, 50 0"
    "$mainMod SHIFT, up, resizeactive, 0 -50"
    "$mainMod SHIFT, down, resizeactive, 0 50"
  ];

  bindm = [
    # Move and resize windows with mouse
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];
}
