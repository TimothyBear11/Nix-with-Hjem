{ config, pkgs, ... }:

{
  # Install Emacs and the companion search utilities Doom relies on
  environment.systemPackages = [
    pkgs.emacs-pgtk # Wayland-native pure GTK Emacs (perfect for Hyprland)
    
  ];
}
