{ config, pkgs, ... }:

{
  # 1. Install the fastfetch binary globally
  environment.systemPackages = [
    pkgs.fastfetch
  ];

  # 2. Configure Hjem mapping with a global clobber rule
  hjem.users.tbear = {
    # This setting forces EVERY file in this module to clobber by default!
    xdg.config.default.clobber = true;

    # Now you can declare files cleanly without adding clobber = true every time!
    xdg.config.files."fastfetch/empty_config.jsonc".source = ../../configs/fastfetch/empty_config.jsonc;
  };
}
