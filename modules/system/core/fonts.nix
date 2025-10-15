{ pkgs, ... }:

let
  # Import the font data from the shared library file.
  typography = import ../../lib/typography.nix { inherit pkgs; };
in
{
  # Install the complete list of font packages provided by the library.
  fonts.packages = typography.packages;
}