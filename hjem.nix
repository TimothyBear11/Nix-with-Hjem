{ config, lib, pkgs, ... }:

{
  hjem.users.tbear = {
    directory = "/home/tbear";


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
