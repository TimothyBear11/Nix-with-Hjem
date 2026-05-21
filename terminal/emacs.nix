{ config, pkgs, ... }:

{
  # 1. Install Emacs with Native Compilation and Wayland support
  environment.systemPackages = [
    # emacs-pgtk provides pure GTK/Wayland support (no XWayland blurriness!)
    pkgs.emacs-pgtk 
  ];

  # 2. Inject environment variables for proper Wayland/XDG handshakes
  environment.variables = {
    # Force Emacs to look in the modern XDG path instead of old ~/.emacs.d
    EMACSDIR = "$HOME/.config/emacs";
  };

  environment.sessionVariables.PATH = [
    "$HOME/.config/emacs/bin"
  ];

  # 3. Map your complete configuration assets using Hjem
  hjem.users.tbear = {
    xdg.config.files = {
      # The core configuration initialization entrypoint
      "emacs/init.el" = {
        source = ../configs/emacs/init.el;
        clobber = true;
      };

      # The early-init file (crucial for tuning UI speed before rendering starts)
      "emacs/early-init.el" = {
        source = ../configs/emacs/early-init.el;
        clobber = true;
      };
    };
  };
}
