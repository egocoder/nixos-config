{ pkgs, ... }:

{
  enabled = true;

  beziers = {
    wind      = [0.05 0.9 0.1 1.05];
    winIn     = [0.1 1.1 0.1 1.1];
    winOut    = [0.3 -0.3 0 1];
    liner     = [1 1 1 1];
    overshot  = [0.05 0.9 0.1 1.05];
    smoothOut = [0.5 0 0.99 0.99];
    smoothIn  = [0.5 -0.5 0.68 1.5];
  };

  animations = [
    { target = "windows";      duration = 1; speed = 6; curve = "wind"; type = "slide"; }
    { target = "windowsIn";    duration = 1; speed = 5; curve = "winIn"; type = "slide"; }
    { target = "windowsOut";   duration = 1; speed = 3; curve = "smoothOut"; type = "slide"; }
    { target = "windowsMove";  duration = 1; speed = 5; curve = "wind"; type = "slide"; }
    { target = "border";       duration = 1; speed = 1; curve = "liner"; }
    { target = "borderangle";  duration = 1; speed = 180; curve = "liner"; loop = true }
    { target = "fade";         duration = 1; speed = 3; curve = "smoothOut" }
    { target = "workspaces";   duration = 1; speed = 5; curve = "overshot" }
    { target = "workspacesIn";  duration = 1; speed = 5; curve = "winIn"; type = "slide" }
    { target = "workspacesOut"; duration = 1; speed = 5; curve = "winOut"; type = "slide" }
  ];
}
