{ config, pkgs, ... }:

{
  # Install Emacs and the companion search utilities Doom relies on
  environment.systemPackages = [
    pkgs.emacs-pgtk # Wayland-native pure GTK Emacs (perfect for Hyprland)
    pkgs.ripgrep      # Fast text searching inside files (Doom project search)
    pkgs.fd           # Fast file finder
    pkgs.git          # Required for Doom to pull down its package modules
  ];
}
