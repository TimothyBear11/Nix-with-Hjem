{ config, pkgs, inputs, ... }:

{
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.system}.niri-unstable;
  };

  hjem.users.tbear = {
    xdg.config.files = {
      # --- Root Niri Mappings ---
      "niri/config.kdl"      = { source = ../configs/niri/config.kdl;      clobber = true; };
      "niri/autostart.kdl"   = { source = ../configs/niri/autostart.kdl;   clobber = true; };
      "niri/binds.kdl"       = { source = ../configs/niri/binds.kdl;       clobber = true; };
      "niri/env.kdl"         = { source = ../configs/niri/env.kdl;         clobber = true; };
      "niri/inputs.kdl"      = { source = ../configs/niri/inputs.kdl;      clobber = true; };
      "niri/layerrules.kdl"  = { source = ../configs/niri/layerrules.kdl;  clobber = true; };
      "niri/layout.kdl"      = { source = ../configs/niri/layout.kdl;      clobber = true; };
      "niri/monitors.kdl"    = { source = ../configs/niri/monitors.kdl;    clobber = true; };
      "niri/noctalia.kdl"    = { source = ../configs/niri/noctalia.kdl;    clobber = true; };
      "niri/windowrules.kdl" = { source = ../configs/niri/windowrules.kdl; clobber = true; };

      # --- Nested DMS Mappings ---
      "niri/dms/alttab.kdl"  = { source = ../configs/niri/dms/alttab.kdl;  clobber = true; };
      "niri/dms/binds.kdl"   = { source = ../configs/niri/dms/binds.kdl;   clobber = true; };
      "niri/dms/colors.kdl"  = { source = ../configs/niri/dms/colors.kdl;  clobber = true; };
      "niri/dms/cursor.kdl"  = { source = ../configs/niri/dms/cursor.kdl;  clobber = true; };
      "niri/dms/layout.kdl"  = { source = ../configs/niri/dms/layout.kdl;  clobber = true; };
      "niri/dms/outputs.kdl" = { source = ../configs/niri/dms/outputs.kdl; clobber = true; };
      "niri/dms/wpblur.kdl"  = { source = ../configs/niri/dms/wpblur.kdl;  clobber = true; };
    };
  };
}
