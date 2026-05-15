{ config, pkgs, inputs, ... }:

{
  # Core Display Server Settings
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";

  # Full Desktop Environment Fallback (Using Plasma 6 via SDDM)
  services.desktopManager.plasma6.enable = true;

  # COSMIC components disabled to prioritize Hyprland/Niri workflows without resource fighting
  services.desktopManager.cosmic.enable = false;
  services.displayManager.cosmic-greeter.enable = false;

  # Declarative Wayland Compositors (Tracking your Flake inputs)
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };
  
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.system}.niri-unstable;
  };
  
  programs.dconf.enable = true;

  # XDG Portals Configuration (Strict routing to prevent desktop environment loops)
  xdg.portal = {
    enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [ "gtk" ];
      };
      hyprland = {
        default = [ "hyprland" "gtk" ];
      };
      niri = {
        default = [ "gnome" "gtk" ]; # Niri fits perfectly with standard GTK/Gnome portal hooks
      };
    };
  };

  # Graphical Environment Packages & Desktop Utilities
  environment.systemPackages = with pkgs; [
    xwayland-satellite  # Seamless XWayland integration
    libsForQt5.qt5ct    # Qt5 Theme Configuration
    kdePackages.qt6ct   # Qt6 Theme Configuration (Crucial for Plasma 6 apps under Hyprland)
    wl-clipboard        # Wayland Clipboard engine
    kanshi              # Dynamic display profile manager
    wlr-randr           # Monitor manipulation tool
    grim                # Screenshot tool
    slurp               # Screen region selector
    pavucontrol         # PulseAudio/PipeWire Volume Control GUI
    gnome-keyring       # Secure password/credential storage backend
    
    # Your Favorite Cosmic Applets
    cosmic-ext-applet-weather
    cosmic-ext-applet-minimon
    cosmic-ext-applet-caffeine
  ];

  # Session Variables for Unified Theme Handshakes
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_QPA_PLATFORM = "wayland;xcb";
  };
}