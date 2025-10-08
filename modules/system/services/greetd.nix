{ pkgs, user, ... }: 
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.zsh}/bin/zsh";
        user = user;
      };
    };
  };
}