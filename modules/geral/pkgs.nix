{ pkgs, ... }:

{
  home.packages = with pkgs; [
    codex
    gum
    tailscale
    go
    sqlite
  ];
}