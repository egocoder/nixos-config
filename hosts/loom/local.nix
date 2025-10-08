{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gcc
    kdePackages.kdenlive
  ];
}
