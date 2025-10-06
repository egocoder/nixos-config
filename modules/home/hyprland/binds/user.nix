{ pkgs, ... }:

[
  "SUPER, D, exec, pkill rofi || true && rofi -show drun -modi drun,filebrowser,run,window"
  "SUPER, Return, exec, $term"
  "SUPER, F, exec, $files"
  "SUPER, K, exec, kdenlive"
  "SUPER, B, exec, firefox"
  "SUPER, R, exec, foliate"
  "SUPER, V, exec, $scriptsDir/ClipManager.sh"
  "SUPER, C, exec, code --ozone-platform=x11"
  "SUPER, O, exec, obsidian --ozone-platform=x11"

  # Example feature toggle
  "SUPER SHIFT, T, exec, $UserScripts/Toggle-tuned.sh"
]
