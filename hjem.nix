{ config, lib, pkgs, ... }:

{
  hjem.users.tbear = {
    directory = "/home/tbear";

    xdg.config.files."fastfetch" = {
      source = ./configs/fastfetch;
      type = "copy";
      clobber = true;
    };

    xdg.config.files."fish" = {
      source = ./configs/fish;
      type = "copy";
      clobber = true;
    };

    xdg.config.files."fuzzel" = {
      source = ./configs/fuzzel;
      type = "copy";
      clobber = true;
    };

    xdg.config.files."hypr" = {
      source = ./configs/hypr;
      type = "copy";
      clobber = true;
    };

    xdg.config.files."kitty" = {
      source = ./configs/kitty;
      type = "copy";
      clobber = true;
    };

    xdg.config.files."mango" = {
      source = ./configs/mango;
      type = "copy";
      clobber = true;
    };

    xdg.config.files."niri" = {
      source = ./configs/niri;
      type = "copy";
      clobber = true;
    };

    xdg.config.files."nvim" = {
      source = ./configs/nvim;
      type = "copy";
      clobber = true;
    };

    xdg.config.files."qtile" = {
      source = ./configs/qtile;
      type = "copy";
      clobber = true;
    };
  };
}
