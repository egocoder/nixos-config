{
  # Binds that repeat while held down (e.g., volume)
  bindel = [
    ", XF86AudioRaiseVolume, exec, pamixer -i 5"
    ", XF86AudioLowerVolume, exec, pamixer -d 5"
    ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
    ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
  ];

  # Binds that trigger once on press
  bindl = [
    ", XF86AudioMute, exec, pamixer -t"
    ", XF86AudioPlay, exec, playerctl play-pause"
    ", XF86AudioNext, exec, playerctl next"
    ", XF86AudioPrev, exec, playerctl previous"
  ];
}