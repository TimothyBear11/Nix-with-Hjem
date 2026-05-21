{ config, pkgs, ... }:

{
  # Install Emacs and the companion search utilities Doom relies on
  environment.systemPackages = [
    pkgs.emacs-pgtk # Wayland-native pure GTK Emacs (perfect for Hyprland)
    
  ];

  
  hjem = {
    # Ensure any preexisting dead symlinks are cleanly overwritten during activation
    clobberByDefault = true;

    users.ilyamiro = {
      enable = true;
      directory = "/home/ilyamiro";
      user = "ilyamiro";

      # 1. Inject Doom's binary location directly into your user session path via POSIX profile
      sessionVariables = {
        PATH = "$HOME/.config/emacs/bin:$PATH";
      };

      # 2. If you want to manage baseline files explicitly via your nixdots repo:
      files = {
        # This writes clean, writable configurations or template blocks right into place
        # ".config/doom/init.el".source = ./doom-config/init.el;
        # ".config/doom/config.el".source = ./doom-config/config.el;
        # ".config/doom/packages.el".source = ./doom-config/packages.el;
      };
    };
  };
}
