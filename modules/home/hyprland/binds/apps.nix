# modules/home/hyprland/binds/apps.nix
{
  # Simple bindings for frequently used applications.
  bind = [
    # Core utilities
    "$mainMod, RETURN, exec, $term"
    "$mainMod, D, exec, $menu"
    "$mainMod, E, exec, $files"
    "$mainMod, H, exec, $editor"

    # --- User Additions ---
    # Development
    "$mainMod, C, exec, $editor"
    "$mainMod, Z, exec, zeditor"

    # Communication & Web
    "$mainMod, B, exec, librewolf"
    "$mainMod, X, exec, vesktop"

    # Gaming
    "$mainMod SHIFT, S, exec, steam"
  ];
}
