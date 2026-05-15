{ config, pkgs, ... }:

{
  # Make the fish shell binary available system-wide
  programs.fish.enable = true;

  # Tell Hjem to take your existing file and symlink it
  hjem.users.tbear = {
    files.".config/fish/config.fish".source = ./config.fish;
    
    # Optional: If you also want to manage your plugin list text file
    files.".config/fish/fish_plugins".text = ''
      jorgebucaran/fisher
      IlanCosman/tide@v6
    '';
  };
}