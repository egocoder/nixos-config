# --- Yazi Plugins ---
# Simple, explicit, and typed. Each plugin is a clear feature.

{ pkgs, ... }: {
  programs.yazi.plugins = with pkgs.yaziPlugins; {
    # --- Core UX Enhancements ---
    smart-enter = smart-enter;        # Unified enter/open behavior
    smart-filter = smart-filter;      # Smarter file filtering
    smart-paste = smart-paste;        # Context-aware paste
    toggle-pane = toggle-pane;        # Pane visibility control
    full-border = full-border;        # Fancy border style

    # --- Git & Dev Workflow ---
    git = git;                        # Git status in file list
    vcs-files = vcs-files;            # Highlight VCS-modified files
    lazygit = lazygit;                # Launch LazyGit inside Yazi
    gitui = gitui;                    # GitUI integration
    projects = projects;              # Manage project sessions

    # --- Preview & Metadata ---
    rich-preview = rich-preview;      # Render previews with Rich
    mediainfo = mediainfo;            # Media file info
    lsar = lsar;                      # Archive preview
    ouch = ouch;                      # Archive decompression preview
    duckdb = duckdb;                  # Data file previews (CSV, etc.)
    glow = glow;                      # Markdown preview
    mime-ext = mime-ext;              # Faster MIME type detection

    # --- System Utilities ---
    recycle-bin = recycle-bin;        # Safe file deletion
    restore = restore;                # Undo deletions
    sudo = sudo;                      # Run privileged operations
    rsync = rsync;                    # File transfer utility
    mount = mount;                    # Mount manager
    wl-clipboard = wl-clipboard;      # Wayland clipboard support
    time-travel = time-travel;        # BTRFS/ZFS snapshot navigation

    # --- UI / Aesthetics ---
    starship = starship;              # Starship prompt integration
    yatline = yatline;                # Status-line customization
    yatline-githead = yatline-githead;# Git info for status line
    yatline-catppuccin = yatline-catppuccin; # Soothing pastel theme
    nord = nord;                      # Nordic theme alternative
    no-status = no-status;            # Minimalist UI option

    # --- Navigation ---
    relative-motions = relative-motions; # Vim-like motions
    jump-to-char = jump-to-char;      # f<char> quick jump
    bypass = bypass;                  # Skip single-subdir directories
    diff = diff;                      # Inline file diff view
    chmod = chmod;                    # Change file permissions
    miller = miller;                  # Tabular data processing
    piper = piper;                    # Pipe commands to preview
  };
}
