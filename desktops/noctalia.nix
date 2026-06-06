{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # 1. Leave v5 as the default 'noctalia' command
    inputs.noctaliav5.packages.${pkgs.stdenv.hostPlatform.system}.default

    # 2. Wrap v4 as 'noctalia4' and isolate its config directory
    (writeShellScriptBin "noctalia4" ''
      XDG_CONFIG_HOME="$HOME/.config/noctalia4_xdg" exec ${inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/noctalia "$@"
    '')
  ];

  hjem.users.tbear = {
    # 3. Map the Marchborn color grid for v5 (Default)
    xdg.config.files."noctalia/palettes/Marchborn/Marchborn.json" = {
      source = ../configs/noctalia/colorschemes/Marchborn/Marchborn.json;
      clobber = true;
    };

    # 4. Map the exact same color grid for v4 (Isolated)
    # Notice the path matches the XDG_CONFIG_HOME override we set in the wrapper above
    xdg.config.files."noctalia4_xdg/noctalia/colorschemes/Marchborn/Marchborn.json" = {
      source = ../configs/noctalia/colorschemes/Marchborn/Marchborn.json;
      clobber = true; 
    };

    # Fuzzel config remains untouched
    xdg.config.files."fuzzel/fuzzel.ini" = {
        source = ../configs/fuzzel/fuzzel.ini;
        clobber = true;
      };
  };
}
