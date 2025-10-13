# modules/home/hyprland/rules/float.nix
{
  # Defines which windows should open in floating mode by default.
  # This keeps transient dialogs and tool windows from disrupting the layout.
  wayland.windowManager.hyprland.settings.windowrulev2 = [
    # Dialogs
    "float, title:^(Open File)$"
    "float, title:^(Save As)$"
    "float, title:^(Authentication Required)$"
    "float, title:^(Confirm)$"
    "float, title:^(Select a file)$"
    
    # Tool windows
    "float, class:^(pavucontrol)$"
    "float, class:^(blueman-manager)$"
    "float, class:^(nm-connection-editor)$"
    "float, title:^(Picture-in-Picture)$"
  ];
}