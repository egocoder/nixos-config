# modules/home/hyprland/startup.nix
{ pkgs, config, ... }:

{
  # Philosophy: Simple module for Hyprland startup applications.
  # Clear meaning: Only defines exec-once commands.
  # Growth without chaos: Easy to add/remove items from the list.

  wayland.windowManager.hyprland.settings = {
    # List of commands to execute once on Hyprland startup
    exec-once = [
      # Environment setup (often handled automatically, but explicit doesn't hurt)
      "${pkgs.dbus}/bin/dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      # "${pkgs.systemd}/bin/systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP" # Systemd should pick this up automatically

      # Polkit Agent (Essential for permissions, replace script with declarative option if possible)
      # Recommend enabling services.polkitGnome.enable = true; in home.nix instead of a script.
      # If using a custom script, ensure it's in $PATH or use absolute path.
      # Example: "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"

      "${pkgs.swww}/bin/swww-daemon --format xrgb"
      "${pkgs.swww}/bin/swww init"
      "sleep 1 && ${pkgs.swww}/bin/swww img ${config.home.homeDirectory}/Pictures/Wallpapers/wallpaper-01.png"

      # System Tray / Applets
      "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator"
      # "${pkgs.blueman}/bin/blueman-applet" # Uncomment if you use Bluetooth

      # Notification Daemon
      "${pkgs.swaynotificationcenter}/bin/swaync"

      # Bar (Commented out as requested)
      # "${pkgs.waybar}/bin/waybar"

      # Clipboard Manager
      "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store"
      "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store"

      # Idle Daemon (for screen locking)
      "${pkgs.hypridle}/bin/hypridle"

      # Add any other user-specific startup apps here
      # "${pkgs.discord}/bin/discord"
    ];
  };

  # Recommendation: Manage Polkit Agent declaratively
  # Add this to your main home.nix or a dedicated services module if preferred
  # services.polkitGnome.enable = true;
}
