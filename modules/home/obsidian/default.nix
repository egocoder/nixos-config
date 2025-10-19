{ pkgs, config, ... }:

let

  gitSyncObsidian = pkgs.writeScriptBin "git-sync-obsidian" ''
    #!${pkgs.stdenv.shell}

    VAULT_DIR="${config.home.homeDirectory}/para"
    GIT_BIN="${pkgs.git}/bin/git"

    cd "$VAULT_DIR" || exit 1

    if [ -z "$($GIT_BIN status --porcelain)" ]; then
      exit 0
    fi

    $GIT_BIN add .
    $GIT_BIN commit -m "sync: $(date '+%Y-%m-%d %H:%M:%S')" || exit 0
  '';

in
{

  home.packages = [
    pkgs.obsidian
    gitSyncObsidian
  ];

  systemd.user.services.git-sync-obsidian = {
    Unit = {
      Description = "Sync Obsidian Vault with Git";
    };
    Service = {
      ExecStart = "${gitSyncObsidian}/bin/git-sync-obsidian";
      Type = "simple";
      Path = [ pkgs.git ];
    };
  };

  systemd.user.timers.git-sync-obsidian = {
    Unit = {
      Description = "Run Git Sync for Obsidian Vault every 15 minutes";
    };
    Timer = {
      OnCalendar = "*:0/15";
      Persistent = true;
    };
    Install.WantedBy = [ "timers.target" ];
  };
}
