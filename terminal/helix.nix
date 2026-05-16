{ config, pkgs, ... }:

{
  # 1. Install the core Helix text editor package
  environment.systemPackages = [
    pkgs.helix
  ];

  # 2. Declare your permanent user configuration styles using Hjem
  hjem.users.tbear = {
    # Force global overwrites across the entire module
    xdg.config.default.clobber = true;

    # Inject your configuration options directly into config.toml
    xdg.config.files."helix/config.toml".text = ''
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
}
