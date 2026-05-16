{ config, pkgs, inputs, ... }:

{
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.system}.niri-unstable;
  };

  hjem.users.tbear = {
    # Force global overwrite for all Niri assets handled inside this module
    xdg.config.default.clobber = true;

    xdg.config.files = {
      # --- Root Niri Layout Mappings ---
      "niri/config.kdl".source        = ../configs/niri/config.kdl;
      "niri/autostart.kdl".source     = ../configs/niri/autostart.kdl;
      "niri/binds.kdl".source         = ../configs/niri/binds.kdl;
      "niri/env.kdl".source           = ../configs/niri/env.kdl;
      "niri/inputs.kdl".source        = ../configs/niri/inputs.kdl;
      "niri/layerrules.kdl".source    = ../configs/niri/layerrules.kdl;
      "niri/layout.kdl".source        = ../configs/niri/layout.kdl;
      "niri/monitors.kdl".source      = ../configs/niri/monitors.kdl;
      "niri/noctalia.kdl".source      = ../configs/niri/noctalia.kdl;
      "niri/windowrules.kdl".source   = ../configs/niri/windowrules.kdl;

      # --- Nested DMS Submodule Mappings ---
      "niri/dms/alttab.kdl".source    = ../configs/niri/dms/alttab.kdl;
      "niri/dms/binds.kdl".source     = ../configs/niri/dms/binds.kdl;
      "niri/dms/colors.kdl".source    = ../configs/niri/dms/colors.kdl;
      "niri/dms/cursor.kdl".source    = ../configs/niri/dms/cursor.kdl;
      "niri/dms/layout.kdl".source    = ../configs/niri/dms/layout.kdl;
      "niri/dms/outputs.kdl".source   = ../configs/niri/dms/outputs.kdl;
      "niri/dms/wpblur.kdl".source    = ../configs/niri/dms/wpblur.kdl;
    };
  };
}
