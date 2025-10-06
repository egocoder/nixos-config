{ pkgs, ... }: {
  programs.hyprland.settings = {
    windowrulev2 = [
      "idleinhibit fullscreen, fullscreen:1"
      "tile, class:^(zen)$" 
      "workspace 9, class:^(virt-viewer)$"
      "workspace 10, class:^([Oo]bsidian)$"
    ];
  };
}
