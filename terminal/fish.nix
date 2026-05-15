{ config, pkgs, ... }:

{
  # Make the fish shell binary available system-wide
  programs.fish.enable = true;

  # Tell Hjem to take your existing file and live-symlink it
  hjem.users.tbear = {
    # Fix: Stepping back out of the terminal folder to hit your central configs folder
    files.".config/fish/config.fish".source = ../configs/fish/config.fish;
    
    # Keeps your plugin tracking profile active
    files.".config/fish/fish_plugins".text = ''
      jorgebucaran/fisher
      IlanCosman/tide@v6
    '';
  };
}