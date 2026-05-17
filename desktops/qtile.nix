{
  config,
  pkgs,
  lib,
  ...
}: {
  # 1. Register Qtile Natively as a Wayland Compositor Session
  services.displayManager.sessionPackages = let
    qtileWrapped = pkgs.python3Packages.qtile.override {
      extraPackages = python3Packages:
        with python3Packages; [
          qtile-extras
          dbus-next
          pulsectl-asyncio
          psutil
        ];
    };
  in [
    (qtileWrapped.overrideAttrs (oldAttrs: {
      doCheck = false;
      doInstallCheck = false;
    }))
  ];

  # 2. Inject your required backends and utilities globally
  environment.systemPackages = with pkgs; [
    fuzzel
    brightnessctl
    pamixer
    kanshi
    swaybg
  ];

  # 3. Map your complete configuration assets using Hjem
  hjem.users.tbear = {
    xdg.config.files = {
      # Core Python Config Mapping
      "qtile/config.py" = {
        source = ../configs/qtile/config.py;
        clobber = true;
      };

      # Executable Initialization Script
      "qtile/autostart.sh" = {
        source = ../configs/qtile/autostart.sh;
        executable = true; # Marks it +x so Qtile can spawn it on login
        clobber = true;
      };

      # 🖥️ Kanshi Display Profile Configuration
      "kanshi/config" = {
        clobber = true;
        text = ''
          # Profile for your 3-monitor layout grid
          profile {
            # OMEN 27i IPS (Main 165Hz Gaming Panel)
            output "HDMI-A-1" enable mode 2560x1440@165 position 1920,0
            exec swaybg -m fill -i ~/nix/Pictures/Wallpapers/GuardianOS.png

            # Sceptre F27 (Secondary 60Hz Panel)
            output "DP-1" enable mode 1920x1080@60 position 0,0
            exec swaybg -m fill -i ~/nix/Pictures/Wallpapers/GuardianOS.png

            # LG 27MP33 (Tertiary 60Hz Panel)
            output "DP-2" enable mode 1920x1080@60 position 4480,0
            exec swaybg -m fill -i ~/nix/Pictures/Wallpapers/GuardianOS.png
          }
        '';
      };
    };
  };
}
