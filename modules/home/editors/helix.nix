{ pkgs, lib, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        scrolloff = 5;
        mouse = false;
        auto-completion = true;

        auto-format = true;

        cursor-shape = {
          insert = "block";
          normal = "block";
          select = "underline";
        };
      };
    };

    extraPackages = with pkgs; [
      nil
      nixpkgs-fmt
      rust-analyzer
      ty
      markdown-oxide
      superhtml
      tombi
    ];

    languages = {
      language = [
        { name = "nix"; formatter = { command = "nixpkgs-fmt"; }; }
        { name = "rust";}
        { name = "python"; formatter = { command = "ty"; }; }
        { name = "markdown"; formatter = { command = "markdown-oxide"; }; }
      ];
    };

  };
}
