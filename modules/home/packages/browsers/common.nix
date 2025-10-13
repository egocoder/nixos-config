# --- Browser Common Settings ---
# Simple modules. Clear meanings. Growth without chaos.
#
# This file defines shared configurations for all browsers,
# primarily the list of extensions, to avoid duplication.
{ pkgs, ... }:

{
  # A list of extensions to be installed on all browsers.
  # This requires NUR (nix-user-repository) to be enabled in your flake.
  extensions = with (pkgs.nur.repos.rycee.firefox-addons or {}); [
    ublock-origin
    bitwarden
    darkreader
    sponsorblock
    tridactyl
    return-youtube-dislikes
    search-by-image
    steam-database
    augmented-steam
    fastforwardteam
    i-dont-care-about-cookies
    enhancer-for-youtube
    clearurls
    languagetool
    markdownload
  ];
}