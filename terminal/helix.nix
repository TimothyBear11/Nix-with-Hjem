{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.helix ];

  hjem.users.tbear = {
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

        # 🚀 CLIPBOARD SHORTCUTS
        [keys.normal]
        "space" = { p = "clipboard_paste_after", P = "clipboard_paste_before", y = "clipboard_yank" }
      '';
    };
  };
}
