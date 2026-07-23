{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Put actual system packages here (e.g. git, vim, fastfetch)
  ];

  programs.noctalia-greeter = {
    enable = true;

    settings = {
      cursor = {
        theme = "Adwaita";
        size = 24;
      };
      idle.timeout = 300;
    };
  };

  hjem.users.tbear = {
    # Load Noctalia's Hjem module inside the user's Hjem space!
    imports = [
      inputs.noctalia.hjemModules.default
    ];

    # v5 config (Default path: ~/.config/noctalia) -> palletts
    xdg.config.files."noctalia/palettes/Marchborn.json" = {
      source = ../configs/noctalia/colorschemes/Marchborn/Marchborn.json;
      clobber = true;
    };

    # Fuzzel config
    xdg.config.files."fuzzel/fuzzel.ini" = {
      source = ../configs/fuzzel/fuzzel.ini;
      clobber = true;
    };
  };
}
