{ config, lib, pkgs, ... }:

{
  hjem.users.tbear = {
    directory = "/home/tbear";

    xdg.config.files."fish/config.fish" = {
      source = ./configs/fish/config.fish;
      clobber = true;
    };

    # If you have the dummy migration file from earlier, map it individually too:
    xdg.config.files."fish/conf.d/fish_frozen_key_bindings.fish" = {
      source = ./configs/fish/conf.d/fish_frozen_key_bindings.fish;
      clobber = true;
    };
    
    xdg.config.files."fastfetch/empty_config.jsonc" = {
      source = ./configs/fastfetch/empty_config.jsonc;
      clobber = true;
    };  
    
  };  
 }
