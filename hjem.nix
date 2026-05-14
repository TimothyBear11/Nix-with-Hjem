{ config, lib, pkgs, ... }:

{
  hjem.users.tbear = {
    enable = true;

    xdg.config.files."fastfetch" = {
      source = ./configs/fastfetch;
      clobber = true;
    };

    xdg.config.files."fish" = {
      source = ./configs/fish;
      clobber = true;
    };

    xdg.config.files."fuzzel" = {
      source = ./configs/fuzzel;
      clobber = true;
    };

    xdg.config.files."hypr" = {
      source = ./configs/hypr;
      clobber = true;
    };

    xdg.config.files."kitty" = {
      source = ./configs/kitty;
      clobber = true;
    };

    xdg.config.files."mango" = {
      source = ./configs/mango;
      clobber = true;
    };

    xdg.config.files."niri" = {
      source = ./configs/niri;
      clobber = true;
    };

    xdg.config.files."nvim" = {
      source = ./configs/nvim;
      clobber = true;
    };

    xdg.config.files."qtile" = {
      source = ./configs/qtile;
      clobber = true;
    };
  };
}
