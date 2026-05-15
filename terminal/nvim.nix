{ config, pkgs, ... }:

{
  # 1. Core Neovim System Module Configuration
  programs.neovim = {
    enable = true;
    withPython3 = false;
    withRuby = false;
    
    # Injected companion tools needed for Treesitter and LazyVim LSPs
    extraPackages = with pkgs; [
      # --- Essentials ---
      ripgrep
      fd
      fzf
      wl-clipboard
      unzip
      
      # --- LSPs & Formatters ---
      lua-language-server
      nil
      nixpkgs-fmt
      nodejs_22
      
      # --- Build Tools for Mason/Treesitter ---
      gcc
      gnumake
      cargo 
    ];
  };

  # 2. Nix Linker-Loader (The Fused LazyVim Safety Net)
  # This guarantees that unpatched Mason binaries can dynamically link to core system libraries
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      glibc
      gcc.cc.lib
      libgcc.lib
      zlib
      zstd
      fuse3
      expat
      openssl
      curl
      nss
      icu
      util-linux
      libsysprof-capture
    ];
  };

  # 3. Hjem Live-Symlink Mirroring
  hjem.users.tbear = {
    # Recursively symlinks your entire local nvim config directory live from your repository folder
    files.".config/nvim".source = ../config/nvim; 
  };
}