{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # -- Languages --
    python3
    go
    nixd

    # -- IDEs --
    
    vscodium
    jetbrains.pycharm
    zed-editor
    positron-bin
    helix
    antigravity
    code-cursor
    windsurf

    # -- Productivity --
    direnv
    lazygit
    bat
    eza
    jq
    devtoolbox
    file
  ];
}
