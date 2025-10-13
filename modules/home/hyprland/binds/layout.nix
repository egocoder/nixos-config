# --- Window and Layout Management Binds ---
# Clear and responsive control over window states.
{
  bind = [
    "$mainMod, Q, killactive,"
    "$mainMod, space, togglefloating,"
    "$mainMod SHIFT, F, fullscreen," # True fullscreen
    "$mainMod, F, fullscreen, 1"   # Toggles fake fullscreen
    "$mainMod, P, pseudo,"
    "$mainMod, J, togglesplit,"
  ];
  binde = [
    "$mainMod SHIFT, left, resizeactive, -20 0"
    "$mainMod SHIFT, right, resizeactive, 20 0"
    "$mainMod SHIFT, up, resizeactive, 0 -20"
    "$mainMod SHIFT, down, resizeactive, 0 20"
  ];
  bindm = [
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];
}