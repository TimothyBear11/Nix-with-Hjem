{ config, pkgs, ... }:

{
  imports =
    [
      ./ai.nix
      ./ambxst.nix
      ./apps.nix
      ./desktops.nix
      ./dev.nix
      ./dms.nix
      ./fontsAndNeeds.nix
      ./gaming.nix
      ./hardware-configuration.nix
      ./hjem.nix
      ./kernel.nix
      ./lazyvim.nix
      ./mango.nix
      ./noctalia.nix
      ./qtile.nix
      ./terminal.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix-den";
  networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.tbear = {
    isNormalUser = true;
    description = "Timothy Bear";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };

  optimise.automatic = true;

  settings = {
      download-buffer-size = 1073741824; # 1GB
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "@wheel" ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.nix-ld.enable = true;
  programs.kdeconnect.enable = true;
  programs.fish.enable = true;

  system.nixos.distroName = "GuardianOS";
  system.nixos.distroId = "guardianos";
  system.nixos.label = "Bear-Edition";
  
  system.stateVersion = "25.05"; # Did you read the comment?

}
