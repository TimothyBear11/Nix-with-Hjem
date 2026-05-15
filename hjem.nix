{ config, lib, pkgs, ... }:

{
  hjem.users.tbear = {
    directory = "/home/tbear";


    
    # --- FASTFETCH ---
    xdg.config.files."fastfetch/empty_config.jsonc" = {
      source = ./configs/fastfetch/empty_config.jsonc;
      clobber = true;
    };

    # --- HYPRLAND ---
    xdg.config.files."hypr/autostart.lua" = {
      source = ./configs/hypr/autostart.lua;
      clobber = true;
    };
    xdg.config.files."hypr/binds.lua" = {
      source = ./configs/hypr/binds.lua;
      clobber = true;
    };
    xdg.config.files."hypr/env.lua" = {
      source = ./configs/hypr/env.lua;
      clobber = true;
    };
    xdg.config.files."hypr/hyprland.lua" = {
      source = ./configs/hypr/hyprland.lua;
      clobber = true;
    };
    xdg.config.files."hypr/inputs.lua" = {
      source = ./configs/hypr/inputs.lua;
      clobber = true;
    };
    xdg.config.files."hypr/layout.lua" = {
      source = ./configs/hypr/layout.lua;
      clobber = true;
    };
    xdg.config.files."hypr/layrules.lua" = {
      source = ./configs/hypr/layrules.lua;
      clobber = true;
    };
    xdg.config.files."hypr/monitors.lua" = {
      source = ./configs/hypr/monitors.lua;
      clobber = true;
    };
    xdg.config.files."hypr/permissions.lua" = {
      source = ./configs/hypr/permissions.lua;
      clobber = true;
    };
    xdg.config.files."hypr/winrules.lua" = {
      source = ./configs/hypr/winrules.lua;
      clobber = true;
    };

    # --- NOCTALIA ---
    xdg.config.files."noctalia/colorschemes/Marchborn/Marchborn.json" = {
      source = ./configs/noctalia/colorschemes/Marchborn/Marchborn.json;
      clobber = true;
    };

    # --- HJEM --- 
    xdg.config.files."helix/config.toml" = {
      clobber = true;
      text = ''
        theme = "noctalia"

        [editor]
        line-number = "relative"
        mouse = true
        cursorline = true

        [editor.cursor-shape]
        insert = "bar"
        normal = "block"
        select = "underline"
      '';
    };
  };
}
