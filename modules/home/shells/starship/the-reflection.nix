{ lib, ... }:

{
  programs.starship.settings = {
    palette = lib.mkForce "weaver-destiny";
    palettes.weaver-destiny = {
      base05 = "#D5D8E2";
      indigo = "#8299C5";
      glow   = "#E3E6F0";
      plum   = "#A995C0";
    };

    format = ''
       [$username@$hostname](palette:indigo)[$directory](palette:glow)
      [$character](palette:plum)'';

    username = { show_always = true; style_user = "palette:indigo"; };
    hostname = { ssh_only = false; style = "palette:indigo"; };

    directory = { style = "palette:glow"; format = "[$path]($style) "; };

    character = {
      success_symbol = "[❖](bold palette:plum)";
      error_symbol = "[❖](bold palette:plum)";
    };
  };
}
