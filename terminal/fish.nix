{ config, pkgs, ... }:

{
  # Make the fish shell binary available system-wide
  programs.fish.enable = true;

  # Global system packages (pulled OUTSIDE of Hjem)
  environment.systemPackages = with pkgs; [
    # Wrap mpv so it natively includes the MPRIS plugin system-wide
    (mpv.override {
      scripts = [ mpvScripts.mpris ];
    })
  ];

  hjem.users.tbear = {
    # Globally enable clobbering for all files managed by Hjem for user tbear
    clobberFiles = true;

    # Main shell file config
    xdg.config.files."fish/config.fish".source = ../configs/fish/config.fish;

    # Keeps your plugin tracking profile active
    xdg.config.files."fish/fish_plugins".text = ''
      jorgebucaran/fisher
      IlanCosman/tide@v6
    '';

    # Core frozen shell mapping bindings
    xdg.config.files."fish/conf.d/fish_frozen_key_bindings.fish".source = ../configs/fish/conf.d/fish_frozen_key_bindings.fish;

    # --- CUSTOM RUNTIME FUNCTIONS ---
    xdg.config.files."fish/functions/goodnight.fish".source            = ../configs/fish/functions/goodnight.fish;
    xdg.config.files."fish/functions/music-next.fish".source           = ../configs/fish/functions/music-next.fish;
    xdg.config.files."fish/functions/music-pause.fish".source          = ../configs/fish/functions/music-pause.fish;
    xdg.config.files."fish/functions/music-peek.fish".source           = ../configs/fish/functions/music-peek.fish;
    xdg.config.files."fish/functions/music-play.fish".source           = ../configs/fish/functions/music-play.fish;
    xdg.config.files."fish/functions/music-prev.fish".source           = ../configs/fish/functions/music-prev.fish;
    xdg.config.files."fish/functions/music-stop.fish".source           = ../configs/fish/functions/music-stop.fish;
    xdg.config.files."fish/functions/nrs.fish".source                  = ../configs/fish/functions/nrs.fish;
    xdg.config.files."fish/functions/play.fish".source                 = ../configs/fish/functions/play.fish;
    xdg.config.files."fish/functions/shell-switcher.fish".source      = ../configs/fish/functions/shell-switcher.fish;
    xdg.config.files."fish/functions/gitnrs.fish".source               = ../configs/fish/functions/gitnrs.fish;
    xdg.config.files."fish/functions/music-import.fish".source         = ../configs/fish/functions/music-import.fish;
    xdg.config.files."fish/functions/shell-launch.fish".source         = ../configs/fish/functions/shell-launch.fish;
    xdg.config.files."fish/functions/shell-kill.fish".source           = ../configs/fish/functions/shell-kill.fish;
    xdg.config.files."fish/functions/anidl.fish".source                = ../configs/fish/functions/anidl.fish;
    xdg.config.files."fish/functions/aniplay.fish".source              = ../configs/fish/functions/aniplay.fish;
    xdg.config.files."fish/functions/animusic.fish".source             = ../configs/fish/functions/animusic.fish;

    # mpv MPRIS symlink
    xdg.config.files."mpv/scripts/mpris.so".source = "${pkgs.mpvScripts.mpris}/share/mpv/scripts/mpris.so";
  };
}
