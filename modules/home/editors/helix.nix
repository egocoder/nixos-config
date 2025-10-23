{ pkgs, lib, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      nil
      nixpkgs-fmt
      rust-analyzer
      ty
      markdown-oxide
      superhtml
      tombi
    ];

    settings = {

      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        scrolloff = 5;
        mouse = false;
        auto-completion = true;
      };
    };

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
