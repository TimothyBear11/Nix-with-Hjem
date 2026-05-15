{ config, pkgs, inputs, ... }:

{
  # 1. Pull the package from the input flake & include essential hardware listeners
  environment.systemPackages = [
    inputs.caelestia-shell.packages.${pkgs.system}.default
    pkgs.quickshell  # The underlying layout engine
    pkgs.brightnessctl # For the control center brightness sliders
    pkgs.ddcutil       # For external monitor control if needed
    pkgs.cava          # For audio visualizer integrations
  ];

  # 2. Let Hjem map the native configurations directly into your home path
  hjem.users.tbear = {
    files.".config/caelestia/shell.json".text = ''
      {
        "theme": "dynamic",
        "animations": true,
        "workspaces": {
          "limit_per_monitor": true,
          "count": 3
        },
        "dock": {
          "enabled": false
        },
        "bar": {
          "enabled": true,
          "position": "top"
        },
        "desktop": {
          "clock": {
            "enabled": true,
            "show_seconds": false,
            "format_12h": true
          },
          "visualizer": {
            "enabled": true,
            "type": "bars",
            "source": "cava",
            "sensitivity": 100
          }
        }
      }
    '';
  };
}
