{ config, lib, pkgs, ... }:

{
  hjem.users.tbear = {
    enable = true;

    xdg.config.files."fastfetch" = {
      source = ./nix/configs/fastfetch;
      clobber = true;
    };

    xdg.config.files."fish" = {
      source = ./nix/configs/fish;
      clobber = true;
    };

    xdg.config.files."fuzzel" = {
      source = ./nix/configs/fuzzel;
      clobber = true;
    };

    xdg.config.files."hypr" = {
      source = ./nix/configs/hypr;
      clobber = true;
    };

    xdg.config.files."kitty" = {
      source = ./nix/configs/kitty;
      clobber = true;
    };

    xdg.config.files."mango" = {
      source = ./nix/configs/mango;
      clobber = true;
    };

    xdg.config.files."niri" = {
      source = ./nix/configs/niri;
      clobber = true;
    };

    xdg.config.files."nvim" = {
      source = ./nix/configs/nvim;
      clobber = true;
    };

    xdg.config.files."qtile" = {
      source = ./nix/configs/qtile;
      clobber = true;
    };
  };
}
