{
  bind = [
    # Move focus with mainMod + arrow keys
    "$mainMod, left, movefocus, l"
    "$mainMod, right, movefocus, r"
    "$mainMod, up, movefocus, u"
    "$mainMod, down, movefocus, d"

    # Switch workspaces with mainMod + [0-9]
    "$mainMod, code:10, workspace, 1"
    "$mainMod, code:11, workspace, 2"
    "$mainMod, code:12, workspace, 3"
    "$mainMod, code:13, workspace, 4"
    "$mainMod, code:14, workspace, 5"
    "$mainMod, code:15, workspace, 6"
    "$mainMod, code:16, workspace, 7"
    "$mainMod, code:17, workspace, 8"
    "$mainMod, code:18, workspace, 9"
    "$mainMod, code:19, workspace, 10" # This is key 0

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    "$mainMod SHIFT, code:10, movetoworkspace, 1"
    "$mainMod SHIFT, code:11, movetoworkspace, 2"
    "$mainMod SHIFT, code:12, movetoworkspace, 3"
    "$mainMod SHIFT, code:13, movetoworkspace, 4"
    "$mainMod SHIFT, code:14, movetoworkspace, 5"
    "$mainMod SHIFT, code:15, movetoworkspace, 6"
    "$mainMod SHIFT, code:16, movetoworkspace, 7"
    "$mainMod SHIFT, code:17, movetoworkspace, 8"
    "$mainMod SHIFT, code:18, movetoworkspace, 9"
    "$mainMod SHIFT, code:19, movetoworkspace, 10" # This is key 0

    # Scroll through existing workspaces with mainMod + scroll
    "$mainMod, mouse_down, workspace, e+1"
    "$mainMod, mouse_up, workspace, e-1"
  ];
}
