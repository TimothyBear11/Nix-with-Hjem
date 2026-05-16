{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.fastfetch ];

  hjem.users.tbear = {
    xdg.config.files."fastfetch/empty_config.jsonc" = {
      source = ../configs/fastfetch/empty_config.jsonc; # 👈 Fixed: Only one step up!
      clobber = true;
    };
  };
}
