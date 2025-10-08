{
  bind = [
    # Terminals
    "$mainMod, K, exec, $term"
    "$mainMod SHIFT, RETURN, exec, alacritty"

    # App Launcher (Rofi)
    "$mainMod, D, exec, pkill rofi || rofi -show drun -modi drun,filebrowser,run,window"

    # File Manager
    "$mainMod, F, exec, $files"
  ];
}