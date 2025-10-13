# modules/home/hyprland/binds/screenshot.nix
{
  # FIX: ALL exec commands with spaces are wrapped in `sh -c '...'`.
  bind = [
    ", Print, exec, sh -c 'grimblast copysave screen'"
    "SHIFT, Print, exec, sh -c 'grimblast copysave area'"
    "CTRL, Print, exec, sh -c 'grimblast copysave active'"
    "$mainMod, R, exec, sh -c 'wf-recorder -f ~/Videos/Screencasts/$(date +\"%Y-%m-%d_%H-%M-%S.mp4\")'"
    "$mainMod SHIFT, R, exec, sh -c 'pkill -INT wf-recorder'"
  ];
}