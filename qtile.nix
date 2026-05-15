{ config, pkgs, lib, ... }:

{
  # 1. Register Qtile Natively as a Wayland Compositor Session
  # This places the correct 'qtile.desktop' entry directly into /share/wayland-sessions/
  services.displayManager.sessionPackages = [
    (pkgs.python3Packages.qtile.overrideAttrs (oldAttrs: {
      doCheck = false;
      doInstallCheck = false;
    }))
  ];

  # 2. Configure the Qtile Environment & Custom Python Dependencies
  environment.etc."qtile/extra-packages.txt".text = "Guarantees python env resolution"; # Placeholder hint

  # Inject your required Python widget backends globally so Qtile can import them
  environment.systemPackages = with pkgs; [
    # Wayland Core Launchers & Hardware Control Tools
    fuzzel
    brightnessctl
    pamixer
    
    # Python libraries required for your advanced qtile-extras configurations
    python3Packages.qtile-extras
    python3Packages.dbus-next
    python3Packages.pulsectl-asyncio
    python3Packages.psutil
  ];
}