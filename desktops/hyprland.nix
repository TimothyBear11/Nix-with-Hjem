{ config, pkgs, inputs, ... }:

{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  hjem.users.tbear = {
    # Set global clobber for all files inside this file module
    xdg.config.default.clobber = true;

    # Clean, scannable configuration asset mappings
    xdg.config.files = {
      "hypr/autostart.lua".source   = ../configs/hypr/autostart.lua;
      "hypr/binds.lua".source       = ../configs/hypr/binds.lua;
      "hypr/env.lua".source         = ../configs/hypr/env.lua;
      "hypr/hyprland.lua".source     = ../configs/hypr/hyprland.lua;
      "hypr/inputs.lua".source      = ../configs/hypr/inputs.lua;
      "hypr/layout.lua".source      = ../configs/hypr/layout.lua;
      "hypr/layrules.lua".source    = ../configs/hypr/layrules.lua;
      "hypr/monitors.lua".source    = ../configs/hypr/monitors.lua;
      "hypr/permissions.lua".source = ../configs/hypr/permissions.lua;
      "hypr/winrules.lua".source    = ../configs/hypr/winrules.lua;
    };
  };
}
