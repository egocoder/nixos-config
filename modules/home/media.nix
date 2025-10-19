{ pkgs, ... }:

{
  home.file."Pictures/Wallpapers" = {
    source = ../../assets/wallpapers;
    recursive = true;
  };
}
