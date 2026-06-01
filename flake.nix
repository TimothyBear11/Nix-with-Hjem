{
  description = "NixOS - Logic meets Magic";

  inputs = {
    # 1. Force the root nixpkgs to follow the cosmic-vetted commit directly
    nixpkgs.follows = "nixos-cosmic/nixpkgs";

    # 2. Define the COSMIC flake package source
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    # 3. Rest of your ecosystem inputs (all safely tracking your unified nixpkgs)
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    
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
    app2unitOverlay = final: prev: {
      app2unit = prev.app2unit.overrideAttrs (old: {
        postPatch = "";
      });
    };
  in {
    nixosConfigurations.nix-den = nixpkgs.lib.nixosSystem {
      modules = [
        {
          nixpkgs.hostPlatform = "x86_64-linux";

          _module.args = { inherit inputs; };

          nix.settings = {
            substituters = [ "https://cosmic.cachix.org/" ];
            # Note: Updated to include the full key string from upstream docs
            trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
          };
        }
        ./configuration.nix
        nixos-cosmic.nixosModules.default
        inputs.mangowm.nixosModules.mango
        inputs.dms.nixosModules.default
        inputs.niri.nixosModules.niri
        inputs.hjem.nixosModules.default

        {
          nixpkgs.overlays = [ app2unitOverlay ];
          nixpkgs.config.allowUnfree = true;
        }
      ];
    };
  };
}
