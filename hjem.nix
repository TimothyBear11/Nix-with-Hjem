{ config, lib, pkgs, ... }:

{
  hjem.users.tbear = {
    directory = "/home/tbear";



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
