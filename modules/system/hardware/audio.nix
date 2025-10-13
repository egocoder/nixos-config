{ pkgs, ... }:

{
  services.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;          # Main PipeWire service
    alsa.enable = true;     # ALSA backend for hardware devices
    alsa.support32Bit = true; # Support 32-bit audio apps (e.g., games)
    pulse.enable = true;    # Compatibility layer for apps using PulseAudio
    jack.enable = false;    # JACK disabled by default (can be enabled later)
  };
}
