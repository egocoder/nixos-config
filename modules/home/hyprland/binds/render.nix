{ pkgs, ... }:

[
  "SUPER, PRINT, exec, grimblast copysave area"
  "SUPER SHIFT, PRINT, exec, grimblast copysave output"
  "SUPER, R, exec, wf-recorder -f ~/Videos/record_$(date +%Y-%m-%d_%H-%M-%S).mp4"
  "SUPER SHIFT, R, exec, pkill -INT -x wf-recorder"
]
