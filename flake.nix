{
  description = "NixOS - Logic meets Magic";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    nixpkgs.follows = "nixos-cosmic/nixpkgs";
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    
    mangowm.url = "github:mangowm/mango";
    mangowm.inputs.nixpkgs.follows = "nixpkgs";

    ambxst.url = "github:Axenide/Ambxst";
    ambxst.inputs.nixpkgs.follows = "nixpkgs";

    caelestia-shell.url = "github:caelestia-dots/shell";
    caelestia-cli.url = "github:caelestia-dots/cli";
    caelestia-cli.inputs.nixpkgs.follows = "nixpkgs";

    dms.url = "github:AvengeMedia/DankMaterialShell";
    dms.inputs.nixpkgs.follows = "nixpkgs";

    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";

    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";

    
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    
  };

  outputs = inputs@{ self, nixpkgs, nixos-cosmic, ... }:
  let
    system = "x86_64-linux";

    app2unitOverlay = final: prev: {
      app2unit = prev.app2unit.overrideAttrs (old: {
        postPatch = "";
      });
    };
  in {
    nixosConfigurations.nix-den = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        {
          nix.settings = {
            substituters = [ "https://cosmic.cachix.org/" ];
            trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBeh"];
          };
        }
        ./configuration.nix
        nixos-cosmic.nixosModules.default
        inputs.mangowm.nixosModules.mango
        inputs.dms.nixosModules.default
        inputs.niri.nixosModules.niri
        inputs.hjem.nixosModules.default

        {
          nixpkgs.overlays = [
            app2unitOverlay
            inputs.nix-openclaw.overlays.default
            
          ];
          nixpkgs.config.allowUnfree = true;
        }
      ];
    };
  };
}
