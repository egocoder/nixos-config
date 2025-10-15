{

  # --- Abbreviations ---
  # add more abbreviations here to extend your shell's vocabulary.
  programs.zsh.zsh-abbr = {
    enable = true;
    abbreviations = {
      G = "| grep";
      L = "| less";
      "..." = "../..";
      "...." = "../../..";
    };
  };

  # --- Standard Aliases ---
  programs.zsh.shellAliases = {
    # --- System Management ---
    nixcfg = "cd ~/nixos-config";
    sw = "sudo nixos-rebuild switch --flake ~/nixos-config";
    upd = "sudo nixos-rebuild switch --flake ~/nixos-config --upgrade";

    # --- Home Manager Workflow ---
    # Clear aliases for common Home Manager tasks.
    hms = "home-manager switch --flake ~/nixos-config";
    hmu = "home-manager update --flake ~/nixos-config";
    hmn = "home-manager news";
    
    # --- Nix Ecosystem ---
    nix-gc = "nix-collect-garbage";
    nix-gcroots = "nix-collect-garbage -d";
    
    # --- Sudo & Permissions ---
    s = "sudo";
    "s!!" = "sudo !!";

    # --- Tool Replacements ---
    ls = "eza --icons";
    cat = "bat";
    y = "yazi";
    se = "sudoedit";
    top = "btop";

    # --- File & Directory Management ---
    la = "eza -a --icons";
    ll = "eza -l --icons";
    "l." = "eza -a | egrep \"^\\.\"";
    mkdir = "mkdir -p";

    # --- Editor Workflow ---
    z = "zeditor";
    v = "nvim";

    # --- Git Workflow ---
    gs = "git status";
    ga = "git add";
    gc = "git commit";
    gp = "git push";
    gd = "git diff";
    gl = "git log --oneline --graph --decorate";

    # --- Process Management ---
    psg = "ps aux | grep -v grep | grep -i";

    # --- Navigation ---
    ".." = "cd .."; # Kept for muscle memory, but abbreviations are preferred.
    
    # --- Networking ---
    myip = "curl ifconfig.me";
  };
}