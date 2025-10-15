# modules/home/terminals/wezterm/domains.nix
# This is a Nix expression that generates a Lua string.

{ pkgs, ... }:
''
  -- Shell domains -- define available shells and the default program.
  -- This provides a clear, single place to add or change shell environments,
  -- enabling growth without chaos.

  -- Set Zsh as the default shell for new tabs. The '-l' flag ensures
  -- it starts as a login shell, loading the full environment.
  config.default_prog = { "${pkgs.zsh}/bin/zsh", "-l" };

  -- Define a menu of shells for quick launching (e.g., with ALT+Enter).
  -- Each entry is a simple module with a clear label and command.
  config.launch_menu = {
    {
      label = "Z Shell",
      args = { "${pkgs.zsh}/bin/zsh", "-l" },
    }, -- FIX: Added a comma to correctly separate table elements in the list.
    {
      label = "Nushell",
      args = { "${pkgs.nushell}/bin/nu" },
    },
  };
''