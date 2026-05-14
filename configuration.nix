{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./cachykernel.nix
      ./ai.nix
      ./ambxst.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;

  networking.hostName = "nix-den"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
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

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    gh
  ];

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
