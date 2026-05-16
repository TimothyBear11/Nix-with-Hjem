{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  hjem.users.tbear = {
    # Force global overwrites for any file configured inside this file module
    xdg.config.default.clobber = true;

    # Map your Marchborn color grid profile
    xdg.config.files."noctalia/colorschemes/Marchborn/Marchborn.json".source = ../configs/noctalia/colorschemes/Marchborn/Marchborn.json;
  };
}
