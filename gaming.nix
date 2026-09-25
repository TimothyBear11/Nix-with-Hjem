{ config, pkgs, ... }:

{
  # Steam configuration
  programs.steam = {
    enable = true;
    # package = pkgs.millennium-steam;
    gamescopeSession.enable = true;

    # Extra compatibility tools (GE-Proton, etc.) inside Steam FHS environment
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # GameMode configuration with proper process renice capabilities
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        renice = 10;
      };
    };
  };

  # Gamescope with capSysNice enabled for realtime thread scheduling
  programs.gamescope = {
    enable = true;
    capSysNice = true; # Required for smooth frame pacing without thread starvation
  };

  # Environment variables for Mesa/RADV (AMD RX 6700 XT) & DXVK memory management
  environment.sessionVariables = {
    # Forces RADV to aggressively free unused VRAM allocations between matches
    AMD_DEBUG = "nongg";
    # Expands Mesa shader disk cache size to prevent mid-game recompilation stutter
    MESA_SHADER_CACHE_MAX_SIZE = "10G";
    __GL_SHADER_DISK_CACHE_SKIP_CLEANUP = "1";
    # Forces DXVK/VKD3D state cache stability
    DXVK_STATE_CACHE = "1";
  };

  # Kernel parameters to fix high memory mapping limits and swap thrashing
  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642; # Prevents Vulkan/Proton memory mapping bottlenecks
    "vm.swappiness" = 10;            # Prevents aggressive swap usage during long sessions
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

  # System packages
  environment.systemPackages = with pkgs; [
    heroic
    protonup-qt
    protonplus
    mangohud # Helpful for monitoring VRAM/RAM usage in real time
  ];
}
