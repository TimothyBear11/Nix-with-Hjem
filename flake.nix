{
  description = "NixOS - Logic meets Magic";

  inputs = {
    # 1. Restore clean, native root nixpkgs tracking unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # 2. Your ecosystem inputs (now cleanly tracking native nixpkgs)
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

    noctalia.url = "github:noctalia-dev/noctalia";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";

    noctalia-greeter.url = "github:noctalia-dev/noctalia-greeter";
    noctalia-greeter.inputs.nixpkgs.follows = "nixpkgs";

    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    millennium.inputs.nixpkgs.follows = "nixpkgs";

    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem-impure = {
      url = "github:Rexcrazy804/hjem-impure";
      inputs.nixpkgs.follows = "";
      inputs.hjem.follows = "";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }:
  {
    nixosConfigurations.nix-den = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; }; 
      
      modules = [
        {
          nixpkgs.hostPlatform = "x86_64-linux";
          _module.args = { inherit inputs; };
          
          # We can drop the cosmic cachix keys completely since standard 
          # nixpkgs builds will evaluate or pull standard system channels.
          nix.settings = {
            substituters = [ "https://cache.nixos.org/" ];
          };
        }
        ./configuration.nix
        inputs.mangowm.nixosModules.mango
        inputs.dms.nixosModules.default
        inputs.niri.nixosModules.niri
        inputs.hjem.nixosModules.default
        inputs.noctalia-greeter.nixosModules.default

        {
          nixpkgs.overlays = [
            inputs.millennium.overlays.default

            # Override the broken bun dependencies hash with the exact one reported by Nix
            (final: prev: {
              millennium-typescript-bun-deps = prev.millennium-typescript-bun-deps.overrideAttrs (oldAttrs: {
                outputHash = "sha256-gQhAqitG9i+WzHnJBI7iEUkAz4/d7hPZlMb+Ace4vA8=";
              });
            })
          ];
        }
      ];
    };
  };
}
