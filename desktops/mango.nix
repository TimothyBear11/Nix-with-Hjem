{ config, pkgs, ... }:

{
  programs.mango.enable = true;

  hjem.users.tbear = {
    # Force global overwrites across the entire module
    xdg.config.default.clobber = true;

    xdg.config.files = {
      # --- Core Layout Grid Mappings ---
      "mango/config.conf".source   = ./configs/mango/config.conf;
      "mango/bind.conf".source     = ./configs/mango/bind.conf;
      "mango/env.conf".source       = ./configs/mango/env.conf;
      "mango/monitor.conf".source   = ./configs/mango/monitor.conf;
      "mango/noctalia.conf".source  = ./configs/mango/noctalia.conf;
      "mango/rule.conf".source      = ./configs/mango/rule.conf;
      "mango/tag.conf".source       = ./configs/mango/tag.conf;

      # --- Executable Shell Configurations ---
      "mango/executable_autostart.sh" = {
        source = ./configs/mango/executable_autostart.sh;
        executable = true; # 👈 Explicitly marks the script +x so it runs instantly on boot!
      };

      # --- Entire Binary Scripts Subdirectory ---
      # Tells Hjem to map your entire custom scripting directory to your system profile path
      "mango/bin" = {
        source = ./configs/mango/bin;
        recursive = true;
      };
    };
  };
}
