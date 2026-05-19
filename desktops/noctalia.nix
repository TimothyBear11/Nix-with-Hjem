{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  hjem.users.tbear = {
    # Map your Marchborn color grid profile with clobber explicitly assigned inside the block
    xdg.config.files."noctalia/colorschemes/Marchborn/Marchborn.json" = {
      source = ../configs/noctalia/colorschemes/Marchborn/Marchborn.json;
      clobber = true; # 👈 Explicitly set here instead of using the nonexistent default block
    };
    xdg.config.files."fuzzel/fuzzel.ini" = {
        source = ../configs/fuzzel/fuzzel.ini;
        clobber = true;
      };
  };
}
