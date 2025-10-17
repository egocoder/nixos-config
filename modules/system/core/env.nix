{
  environment.sessionVariables = rec {
    TERMINAL = "wezterm";
    EDITOR = "hx";
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [ "${XDG_BIN_HOME}" ];
  };
}
