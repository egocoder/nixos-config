# modules/home/hyprland/binds/media.nix
{
  # FIX: ALL exec commands with spaces are wrapped in `sh -c '...'`.
  bindel = [
    ", XF86AudioRaiseVolume, exec, sh -c 'pamixer -i 5'"
    ", XF86AudioLowerVolume, exec, sh -c 'pamixer -d 5'"
    ", XF86MonBrightnessUp, exec, sh -c 'brightnessctl set +5%'"
    ", XF86MonBrightnessDown, exec, sh -c 'brightnessctl set 5%-'"
  ];
  bindl = [
    ", XF86AudioMute, exec, sh -c 'pamixer -t'"
    ", XF86AudioPlay, exec, sh -c 'playerctl play-pause'"
    ", XF86AudioNext, exec, sh -c 'playerctl next'"
    ", XF86AudioPrev, exec, sh -c 'playerctl previous'"
  ];
}