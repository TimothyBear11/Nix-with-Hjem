{ config, pkgs, ... }:

{
  # Make the fish shell binary available system-wide
  programs.fish.enable = true;

  # Global system packages (pulled OUTSIDE of Hjem)
  environment.systemPackages = with pkgs; [
    # Wrap mpv so it natively includes the MPRIS plugin system-wide
    (mpv.override {
      scripts = [ mpvScripts.mpv-mpris ];
    })
  ];

  hjem.users.tbear = {
    # Main shell file config
    xdg.config.files."fish/config.fish" = {
      source = ../configs/fish/config.fish;
      clobber = true;
    };
    
    # Keeps your plugin tracking profile active
    xdg.config.files."fish/fish_plugins" = {
      clobber = true;
      text = ''
        jorgebucaran/fisher
        IlanCosman/tide@v6
      '';
    };

    # Core frozen shell mapping bindings
    xdg.config.files."fish/conf.d/fish_frozen_key_bindings.fish" = {
      source = ../configs/fish/conf.d/fish_frozen_key_bindings.fish;
      clobber = true;
    };
    
    # --- CUSTOM RUNTIME FUNCTIONS ---
    xdg.config.files."fish/functions/fupdate-safe.fish".source    = ../configs/fish/functions/fupdate-safe.fish;
    xdg.config.files."fish/functions/git-safe.fish".source        = ../configs/fish/functions/git-safe.fish;
    xdg.config.files."fish/functions/goodnight.fish".source       = ../configs/fish/functions/goodnight.fish;
    xdg.config.files."fish/functions/music-next.fish".source      = ../configs/fish/functions/music-next.fish;
    xdg.config.files."fish/functions/music-pause.fish".source     = ../configs/fish/functions/music-pause.fish;
    xdg.config.files."fish/functions/music-peek.fish".source      = ../configs/fish/functions/music-peek.fish;
    xdg.config.files."fish/functions/music-play.fish".source      = ../configs/fish/functions/music-play.fish;
    xdg.config.files."fish/functions/music-prev.fish".source      = ../configs/fish/functions/music-prev.fish;
    xdg.config.files."fish/functions/music-stop.fish".source      = ../configs/fish/functions/music-stop.fish;
    xdg.config.files."fish/functions/nix-clean.fish".source       = ../configs/fish/functions/nix-clean.fish;
    xdg.config.files."fish/functions/nix-du.fish".source          = ../configs/fish/functions/nix-du.fish;
    xdg.config.files."fish/functions/nrs.fish".source             = ../configs/fish/functions/nrs.fish;
    xdg.config.files."fish/functions/play.fish".source            = ../configs/fish/functions/play.fish;
    xdg.config.files."fish/functions/shell-switch.fish".source    = ../configs/fish/functions/shell-switch.fish;
    xdg.config.files."fish/functions/gitnrs.fish".source          = ../configs/fish/functions/gitnrs.fish;
    xdg.config.files."fish/functions/music-import.fish".source    = ../configs/fish/functions/music-import.fish;
    
    # The mpris.so symlink config stays safely down here in Hjem user-space
    xdg.config.files."mpv/scripts/mpris.so".source = "${pkgs.mpvScripts.mpv-mpris}/share/mpv/scripts/mpris.so";
  };
}
