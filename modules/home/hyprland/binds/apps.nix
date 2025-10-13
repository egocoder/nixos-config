# modules/home/hyprland/binds/apps.nix
{
  # Simple bindings for frequently used applications.
  bind = [
    # Core utilities
    "$mainMod, RETURN, exec, $term"
    "$mainMod, D, exec, $menu"
    "$mainMod, E, exec, $files"

    # --- User Additions ---
    # Development
    "$mainMod, C, exec, $editor" # FIX: Use the new $editor variable.
    "$mainMod, Z, exec, zed"

    # Communication & Web
    "$mainMod, B, exec, firefox"
    "$mainMod, X, exec, vesktop"
  ];
}