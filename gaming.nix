{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    # package = pkgs.millennium-steam;
    gamescopeSession.enable = true;

    # Enable extra compatibility packages & 32-bit driver libraries inside Steam FHS env
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # 1. FIX: Enable GameMode and set capSysNice so gamemode can actually apply process priorities
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        renice = 10;
      };
    };
  };

  # 2. FIX: Set capSysNice to true so gamescope can set realtime thread scheduling
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  # 3. FIX: Prevent Mesa/Driver VRAM leaks and shader cache eviction on NixOS
  environment.sessionVariables = {
    MESA_SHADER_CACHE_MAX_SIZE = "10G";
    __GL_SHADER_DISK_CACHE_SKIP_CLEANUP = "1";
    # Helps DXVK flush stale pipeline allocations on map reloads
    DXVK_STATE_CACHE = "1";
  };

  # 4. FIX: Set swap and memory pressure tweaks at the kernel level
  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642; # Required for modern games/DXVK memory mappings
    "vm.swappiness" = 10;            # Prevents premature swap thrashing
  };

  # Controller support - udev rules
  services.udev = {
    extraRules = ''
      # Xbox controller udev rules
      SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02ea", MODE="0666"
      SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02ff", MODE="0666"
      SUBSYSTEM=="usb", ATTR{idVendor}=="045e", ATTR{idProduct}=="02e0", MODE="0666"
    '';
  };

  environment.systemPackages = with pkgs; [
    heroic
    protonup-qt
    protonplus
    mangohud # Recommended for tracking real-time VRAM/RAM leaks in-game
  ];
}
