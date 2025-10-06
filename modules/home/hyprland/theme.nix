{ config, ... }: {
  programs.hyprland.settings = {
    general = {
      "col.active_border" = "rgb(${config.stylix.colors.base01})";
      "col.inactive_border" = "rgb(${config.stylix.colors.base00})";
    };
    group = {
      "col.border_active" = "rgb(${config.stylix.colors.base01})";
      groupbar."col.active" = "rgb(${config.stylix.colors.base00})";
    };
  };
}
