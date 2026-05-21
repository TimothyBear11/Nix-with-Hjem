{ config, pkgs, ... }:

{
  # Install Emacs and the companion search utilities Doom relies on
  environment.systemPackages = [
    pkgs.emacs-pgtk # Wayland-native pure GTK Emacs (perfect for Hyprland)
    pkgs.emacsPackages.vterm
    pkgs.emacsPackages.tabspaces
    pkgs.emacsPackages.rainbow-delimiters
    pkgs.emacsPackages.highlight-indent-guides
    pkgs.emacsPackages.centaur-tabs
    pkgs.emacsPackages.jinx
    pkgs.emacsPackages.evil
    pkgs.emacsPackages.nix-mode
    pkgs.emacsPackages.direnv
    pkgs.emacsPackages.magit
    pkgs.emacsPackages.lsp-mode
    pkgs.emacsPackages.elpaca
    pkgs.emacsPackages.general
    pkgs.emacsPackages.evil-collection
    pkgs.emacsPackages.corfu
    pkgs.emacsPackages.vertico
    pkgs.emacsPackages.consult
    pkgs.emacsPackages.marginalia
    pkgs.emacsPackages.embark
    pkgs.emacsPackages.helpful
    pkgs.emacsPackages.no-littering
    pkgs.emacsPackages.dirvish
    pkgs.emacsPackages.treemacs
    pkgs.emacsPackages.apheleia
    pkgs.emacsPackages.orderless
    pkgs.emacsPackages.dape
    pkgs.emacsPackages.yasnippet
  ];
}
