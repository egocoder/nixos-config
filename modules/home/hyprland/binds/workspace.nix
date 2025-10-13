{
  # Simple modules. Clear meanings. Growth without chaos.
  # This file is built from the ground up using the most stable and
  # well-documented Hyprland syntax to ensure compatibility.

  # --- Primary Binds ---
  bind = [
    # === FOCUS MOVEMENT ===
    # A clear mapping of arrow keys to focus direction.
    "$mainMod, left, movefocus, l"
    "$mainMod, right, movefocus, r"
    "$mainMod, up, movefocus, u"
    "$mainMod, down, movefocus, d"

    # === WORKSPACE SWITCHING ===
    # Direct access to workspaces 1 through 10.
    "$mainMod, 1, workspace, 1"
    "$mainMod, 2, workspace, 2"
    "$mainMod, 3, workspace, 3"
    "$mainMod, 4, workspace, 4"
    "$mainMod, 5, workspace, 5"
    "$mainMod, 6, workspace, 6"
    "$mainMod, 7, workspace, 7"
    "$mainMod, 8, workspace, 8"
    "$mainMod, 9, workspace, 9"
    "$mainMod, 0, workspace, 10"

    # === WINDOW MOVING ===
    # Move the active window to a specific workspace.
    "$mainMod SHIFT, 1, movetoworkspace, 1"
    "$mainMod SHIFT, 2, movetoworkspace, 2"
    "$mainMod SHIFT, 3, movetoworkspace, 3"
    "$mainMod SHIFT, 4, movetoworkspace, 4"
    "$mainMod SHIFT, 5, movetoworkspace, 5"
    "$mainMod SHIFT, 6, movetoworkspace, 6"
    "$mainMod SHIFT, 7, movetoworkspace, 7"
    "$mainMod SHIFT, 8, movetoworkspace, 8"
    "$mainMod SHIFT, 9, movetoworkspace, 9"
    "$mainMod SHIFT, 0, movetoworkspace, 10"
    
    # === WORKSPACE CYCLING (KEYBOARD & MOUSE) ===
    # Cycle through workspaces using keys.
    "$mainMod, mouse_down, workspace, e+1"
    "$mainMod, mouse_up, workspace, e-1"
    "$mainMod, period, workspace, e+"
    "$mainMod, comma, workspace, e-1"

    # === SPECIAL WORKSPACE (SCRATCHPAD) ===
    # The safest syntax for the special workspace feature.
    "$mainMod, S, togglespecialworkspace,"
    "$mainMod SHIFT, S, movetoworkspace, special"
  ];
}
