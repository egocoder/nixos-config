{
  # Philosophy: Simple modules. Clear meaning. Growth without chaos.
  # Define global environment variables for shells and user sessions.

  environment.sessionVariables = rec {
    TERMINAL = "wezterm";
    EDITOR = "helix";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [ "${XDG_BIN_HOME}" ];  # Extend PATH for local binaries
  };
}
