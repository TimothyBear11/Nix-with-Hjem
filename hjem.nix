{ config, lib, pkgs, ... }:

{
  hjem.users.tbear = {
    directory = "/home/tbear";

    # --- FISH ---
    xdg.config.files."fish/config.fish" = {
      source = ./configs/fish/config.fish;
      clobber = true;
    };
    xdg.config.files."fish/fish_plugins" = {
      source = ./configs/fish/fish_plugins;
      clobber = true;
    };
    
    xdg.config.files."fish/conf.d/fish_frozen_key_bindings.fish" = {
      source = ./configs/fish/conf.d/fish_frozen_key_bindings.fish;
      clobber = true;
    };
    xdg.config.files."fish/functions/fupdate-safe.fish" = {
      source = ./configs/fish/functions/fupdate-safe.fish;
      clobber = true;
    };
    xdg.config.files."fish/functions/git-safe.fish" = {
      source = ./configs/fish/functions/git-safe.fish;
      clobber = true;
    };
    xdg.config.files."fish/functions/goodnight.fish" = {
      source = ./configs/fish/functions/goodnight.fish;
      clobber = true;
    };
    xdg.config.files."fish/functions/music-next.fish" = {
      source = ./configs/fish/functions/music-next.fish;
      clobber = true;
    };
    xdg.config.files."fish/functions/music-pause.fish" = {
      source = ./configs/fish/functions/music-pause.fish;
      clobber = true;
    };
    xdg.config.files."fish/functions/music-peek.fish" = {
      source = ./configs/fish/functions/music-peek.fish;
      clobber = true;
    };
    xdg.config.files."fish/functions/music-play.fish" = {
      source = ./configs/fish/functions/music-play.fish;
      clobber = true;
    };
    xdg.config.files."fish/functions/music-prev.fish" = {
      source = ./configs/fish/functions/music-prev.fish;
      clobber = true;
    };
    xdg.config.files."fish/functions/music-stop.fish" = {
      source = ./configs/fish/functions/music-stop.fish;
      clobber = true;
    };
    xdg.config.files."fish/functions/nix-clean.fish" = {
      source = ./configs/fish/functions/nix-clean.fish;
      clobber = true;
    };
    xdg.config.files."fish/functions/nix-du.fish" = {
      source = ./configs/fish/functions/nix-du.fish;
      clobber = true;
    };
    xdg.config.files."fish/functions/nrs.fish" = {
      source = ./configs/fish/functions/nrs.fish;
      clobber = true;
    };
    xdg.config.files."fish/functions/play.fish" = {
      source = ./configs/fish/functions/play.fish;
      clobber = true;
    };
    
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
  };  
}