{ config, pkgs, lib, ... }:

{
  # 1. Register Qtile Natively as a Wayland Compositor Session
  services.displayManager.sessionPackages = [
    (pkgs.python3Packages.qtile.overrideAttrs (oldAttrs: {
      doCheck = false;
      doInstallCheck = false;
    }))
  ];

  # 2. Inject your required Python widget backends globally so Qtile can import them
  environment.systemPackages = with pkgs; [
    fuzzel
    brightnessctl
    pamixer
    
    python3Packages.qtile-extras
    python3Packages.dbus-next
    python3Packages.pulsectl-asyncio
    python3Packages.psutil
  ];

  # 3. Map your complete configuration assets using Hjem
  hjem.users.tbear = {
    # Force global overwrites for all Qtile assets in this module
    xdg.config.default.clobber = true;

    xdg.config.files = {
      # Core Python Config Mapping
      "qtile/config.py".source = ../configs/qtile/config.py;

      # Executable Initialization Script
      "qtile/executable_autostart.sh" = {
        source = ../configs/qtile/executable_autostart.sh;
        executable = true; # Marks it +x so Qtile can spawn it on login
      };
    };
  };
}
