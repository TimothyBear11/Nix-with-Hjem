{ config, lib, pkgs, ... }:

{
  hjem.users.tbear = {
    directory = "/home/tbear";

    # --- FISH ---
    xdg.config.files."fish/config.fish" = {
      source = ./configs/fish/config.fish;
      clobber = true;
    };
    xdg.config.files."fish/conf.d/fish_frozen_key_bindings.fish" = {
      source = ./configs/fish/conf.d/fish_frozen_key_bindings.fish;
      clobber = true;
    };
    
    # --- FASTFETCH ---
    xdg.config.files."fastfetch/empty_config.jsonc" = {
      source = ./configs/fastfetch/empty_config.jsonc;
      clobber = true;
    };  

    # --- HYPRLAND ---
    xdg.config.files."hypr/autostart.conf" = {
      source = ./configs/hypr/autostart.conf;
      clobber = true;
    };
    xdg.config.files."hypr/binds.conf" = {
      source = ./configs/hypr/binds.conf;
      clobber = true;
    };
    xdg.config.files."hypr/env.conf" = {
      source = ./configs/hypr/env.conf;
      clobber = true;
    };
    xdg.config.files."hypr/hyprland.conf" = {
      source = ./configs/hypr/hyprland.conf;
      clobber = true;
    };
    xdg.config.files."hypr/hyprtoolkit.conf" = {
      source = ./configs/hypr/hyprtoolkit.conf;
      clobber = true;
    };
    xdg.config.files."hypr/inputs.conf" = {
      source = ./configs/hypr/inputs.conf;
      clobber = true;
    };
    xdg.config.files."hypr/layout.conf" = {
      source = ./configs/hypr/layout.conf;
      clobber = true;
    };
    xdg.config.files."hypr/layrules.conf" = {
      source = ./configs/hypr/layrules.conf;
      clobber = true;
    };
    xdg.config.files."hypr/monitors.conf" = {
      source = ./configs/hypr/monitors.conf;
      clobber = true;
    };
    xdg.config.files."hypr/permissions.conf" = {
      source = ./configs/hypr/permissions.conf;
      clobber = true;
    };
    xdg.config.files."hypr/winrules.conf" = {
      source = ./configs/hypr/winrules.conf;
      clobber = true;
    };

    # --- NOCTALIA ---
    xdg.config.files."noctalia/colorschemes/Marchborn/Marchborn!.json" = {
      source = ./configs/noctalia/colorschemes/Marchborn/Marchborn!.json;
      clobber = true;
    };
  };  
}