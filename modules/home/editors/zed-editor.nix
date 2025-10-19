{ pkgs, lib, ... }:

{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;

    extensions = [
      "nix"
      "discord-presence"
      "rust-analyzer"
      "pylance"
      "docker"
      "dockerfile"
      "docker-compose"
      "even-better-toml"
      "prettier"
      "todo-tree"
      "material-icon-theme"
      "git-firefly"
      "basedPyright"
      "python-snippets"
    ];

    userSettings = lib.mkForce {
      theme = "Base16 Weaver Void";
      autosave = "on_focus_change";

      # Cursor
      "cursor_shape" = "block";
      "hide_mouse" = "on_typing";

      "vim_mode" = true;

      # Fonts
      "buffer_font_family" = "Terminess Nerd Font Mono";
      "ui_font_family" = "Terminess Nerd Font Mono";
      "ui_font_size" = 16;

      # Terminal
      "terminal" = {
        "font_family" = "Terminess Nerd Font Mono";
        "font_size" = 14;
      };
    };
    # Keymaps
    userKeymaps = [
      {
        "key" = "ctrl-shift-p";
        "command" = "command_palette.show";
      }
    ];
  };
}
