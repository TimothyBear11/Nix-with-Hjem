{ config, pkgs, ... }:

{
  # MangoWM system configurations module space
  environment.systemPackages = [ ];

  hjem.users.tbear = {
    xdg.config.files = {
      # --- Core Layout Grid Mappings ---
      "mango/config.conf"   = { source = ./configs/mango/config.conf;   clobber = true; };
      "mango/bind.conf"     = { source = ./configs/mango/bind.conf;     clobber = true; };
      "mango/env.conf"      = { source = ./configs/mango/env.conf;      clobber = true; };
      "mango/monitor.conf"  = { source = ./configs/mango/monitor.conf;  clobber = true; };
      "mango/noctalia.conf" = { source = ./configs/mango/noctalia.conf; clobber = true; };
      "mango/rule.conf"     = { source = ./configs/mango/rule.conf;     clobber = true; };
      "mango/tag.conf"      = { source = ./configs/mango/tag.conf;      clobber = true; };

      # --- Executable Shell Configurations ---
      "mango/executable_autostart.sh" = {
        source = ./configs/mango/executable_autostart.sh;
        executable = true;
        clobber = true;
      };

      # --- Entire Binary Scripts Subdirectory ---
      # Hjem handles entire folders recursively by default—no flag needed!
      "mango/bin" = {
        source = ./configs/mango/bin;
        clobber = true;
      };
    };
  };
}
