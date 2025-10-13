{
  # --- Screen Capture and Recording ---
  # Quick access to screenshots and screen recording.

  bind = [
    ", Print, exec, grimblast copysave screen"              # Full screen
    "$mainMod, Print, exec, grimblast copysave area"        # Select area
    "$mainMod SHIFT, Print, exec, grimblast copysave output" # Focused output
    "ALT, Print, exec, grimblast copysave active"           # Active window
    "$mainMod, R, exec, wf-recorder -f ~/Videos/record_$(date +%Y-%m-%d_%H-%M-%S).mp4"
    "$mainMod SHIFT, R, exec, pkill -INT -x wf-recorder"    # Stop recording
  ];
}
