{ pkgs, ... }:

{
  home.packages = with pkgs; [
    codex
    gh
    gum
    home-manager
    tailscale
    go
    sqlite
  ];
}