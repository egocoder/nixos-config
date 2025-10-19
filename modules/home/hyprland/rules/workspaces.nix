# modules/home/hyprland/rules/workspaces.nix
{
  # Defines rules for window placement and initial state.
  wayland.windowManager.hyprland.settings.windowrulev2 = [
    # Pin Picture-in-Picture windows to be always on top.
    "pin, title:^(Picture-in-Picture)$"

    # Prevent idle when any application is fullscreen.
    "idleinhibit fullscreen, fullscreen:1"

    # Assign applications to specific workspaces on launch.
    "workspace 1, class:^(Code|Cursor|Zed)$"
    "workspace 2, class:^(firefox|librewolf)$"
    "workspace 4, class:^([Vv]esktop|[Ww]hatsapp-for-linux)$"
    "workspace 8, class:^(steam|lutris|heroic)$" # Added games
    "workspace 9, class:^(virt-viewer)$"
    "workspace 10, class:^([Oo]bsidian)$"

    # --- Move to Workspace Silently ---
    # These rules move windows without switching focus to that workspace.
    # Useful for organizing your session without interrupting your flow.
    "movetoworkspacesilent 1, class:^(code|VSCodium|Zed)$"
    "movetoworkspacesilent 2, class:^(firefox|librewolf)$"
    "movetoworkspacesilent 4, class:^(vesktop)$"
  ];
}
