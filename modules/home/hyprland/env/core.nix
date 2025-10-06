{ pkgs, ... }: {
  home.sessionVariables = {
    # -- Core Wayland Toolkits --
    GDK_BACKEND = "wayland,x11,*";
    QT_QPA_PLATFORM = "wayland;xcb";
    CLUTTER_BACKEND = "wayland";
    SDL_VIDEODRIVER = "wayland";

    # -- XDG Session Definitions --
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";

    # -- QT/GTK Integration --
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_QUICK_CONTROLS_STYLE = "org.hyprland.style";

    # -- Cursor Theme --
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRCURSOR_SIZE = "20";

    # -- General Scaling --
    GDK_SCALE = "1";
    QT_SCALE_FACTOR = "1";

    # -- Browser & Toolkit Hints --
    MOZ_ENABLE_WAYLAND = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };
}
