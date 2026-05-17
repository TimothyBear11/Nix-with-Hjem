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
