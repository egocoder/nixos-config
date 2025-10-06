{ pkgs, ... }:

[
  ", XF86AudioRaiseVolume, exec, pamixer -i 5"
  ", XF86AudioLowerVolume, exec, pamixer -d 5"
  ", XF86AudioMute, exec, pamixer -t"

  ", XF86AudioPlay, exec, playerctl play-pause"
  ", XF86AudioNext, exec, playerctl next"
  ", XF86AudioPrev, exec, playerctl previous"

  ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
  ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
]
