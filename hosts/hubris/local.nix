{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gcc
    kdenlive
  ];
}
