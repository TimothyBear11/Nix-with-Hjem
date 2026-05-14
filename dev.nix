{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # -- Languages --
    python3
    go

    # -- IDEs --
    
    vscodium
    jetbrains.pycharm
    zed-editor
    positron-bin
    helix
    antigravity

    # -- Productivity --
    direnv         s
    lazygit
    bat
    eza
    jq
    devtoolbox
    file
  ];
}
