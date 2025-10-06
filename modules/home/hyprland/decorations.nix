{ pkgs, ... }: {
  programs.hyprland.settings = {
    decoration = {
      rounding = 10;
      active_opacity = 1.0;
      inactive_opacity = 0.9;
      fullscreen_opacity = 1.0;

      dim_inactive = true;
      dim_strength = 0.1;

      shadow = {
        enabled = false;
      };

      blur = {
        enabled = true;
        size = 6;
        passes = 2;
        ignore_opacity = true;
        new_optimizations = true;
      };
    };
  };
}