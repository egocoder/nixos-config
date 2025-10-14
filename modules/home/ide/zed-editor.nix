{ pkgs, lib, ... }:

{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;

    extensions = [
      "nix"
      "discord-presence"
    ];

    userSettings = lib.mkForce {
      theme = "Yugen";
      autosave = "on_focus_change";
      editor = {
        font_size = 12;
        font_family = "JetBrainsMono Nerd Font";
      };
    };

    userKeymaps = [
      {
        key = "ctrl-shift-p";
        command = "command_palette.show";
      }
      {
        key = "ctrl-b";
        command = "toggle_sidebar";
      }
    ];
  };

}
