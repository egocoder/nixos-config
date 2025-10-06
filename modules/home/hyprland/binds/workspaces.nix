{ pkgs, ... }:

[
  # Focus movement
  "SUPER, left, movefocus, l"
  "SUPER, right, movefocus, r"
  "SUPER, up, movefocus, u"
  "SUPER, down, movefocus, d"

  # Switch workspaces
  "SUPER, 1, workspace, 1"
  "SUPER, 2, workspace, 2"
  "SUPER, 3, workspace, 3"
  "SUPER, 4, workspace, 4"
  "SUPER, 5, workspace, 5"

  # Move window to workspace
  "SUPER SHIFT, 1, movetoworkspace, 1"
  "SUPER SHIFT, 2, movetoworkspace, 2"
  "SUPER SHIFT, 3, movetoworkspace, 3"
  "SUPER SHIFT, 4, movetoworkspace, 4"
  "SUPER SHIFT, 5, movetoworkspace, 5"
]
