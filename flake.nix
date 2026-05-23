{
  description = "NixOS - Logic meets Magic";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    mangowm.url = "github:mangowm/mango";
    mangowm.inputs.nixpkgs.follows = "nixpkgs";

    ambxst.url = "github:Axenide/Ambxst";
    ambxst.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

    caelestia-shell.url = "github:caelestia-dots/shell";
    caelestia-cli.url = "github:caelestia-dots/cli";
    caelestia-cli.inputs.nixpkgs.follows = "nixpkgs";

    dms.url = "github:AvengeMedia/DankMaterialShell";
    dms.inputs.nixpkgs.follows = "nixpkgs";

    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";

    nix-openclaw.url = "github:openclaw/nix-openclaw";
    nix-openclaw.inputs.nixpkgs.follows = "nixpkgs";

    millennium.url = "github:SteamClientHomebrew/Millennium/v2.35.0";
    millennium.inputs.nixpkgs.follows = "nixpkgs";

    niri.url = "github:sodiboo/niri-flake";

    illogical-flake.url = "github:soymou/illogical-flake";
    illogical-flake.inputs.nixpkgs.follows = "nixpkgs";

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    
  };

  outputs = inputs@{ self, nixpkgs, ... }:
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
        ./configuration.nix

        inputs.mangowm.nixosModules.mango
        inputs.dms.nixosModules.default
        inputs.niri.nixosModules.niri
        inputs.hjem.nixosModules.default

        {
          nixpkgs.overlays = [
            app2unitOverlay
            inputs.nix-openclaw.overlays.default
            inputs.millennium.overlays.default
          ];
          nixpkgs.config.allowUnfree = true;
        }
      ];
    };
  };
}
