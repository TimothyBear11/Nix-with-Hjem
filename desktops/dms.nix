{ pkgs, inputs, ... }:
{

  programs.dms-shell = {
  enable = true;

  systemd = {
    enable = false;
    restartIfChanged = true;
  };

};

}
