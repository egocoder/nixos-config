# modules/home/hyprland/binds/user.nix
{
  bind = [
    # FIX: Command is wrapped in `sh -c '...'` to prevent parsing errors.
    "$mainMod SHIFT, E, exec, sh -c 'alacritty -t \"Zellij Web Dev\" -e zellij attach --create web-dev'"
  ];
}