{ pkgs, inputs, ... }: {
  nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ];
  boot.kernelPackages = pkgs.linuxPackagesFor inputs.nix-cachyos-kernel.packages.${pkgs.system}.linux-cachyos-latest-lto-x86_64-v3;
#  boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;

  # 2. Binary cache settings
  nix.settings = {
    substituters = [ "https://attic.xuyh0120.win/lantian" ];
    trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];

  };
}
