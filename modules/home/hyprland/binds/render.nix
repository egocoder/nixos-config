{
  bind = [
    # Screenshots with grimblast
    ", Print, exec, grimblast copysave screen"
    "$mainMod, Print, exec, grimblast copysave area"
    "$mainMod SHIFT, Print, exec, grimblast copysave output"
    "ALT, Print, exec, grimblast copysave active"

    # Screen recording with wf-recorder
    "$mainMod, R, exec, wf-recorder -f ~/Videos/record_$(date +%Y-%m-%d_%H-%M-%S).mp4"
    "$mainMod SHIFT, R, exec, pkill -INT -x wf-recorder"
  ];
}
