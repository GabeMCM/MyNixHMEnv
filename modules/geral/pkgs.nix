{ pkgs, ... }:

{
  home.packages = with pkgs; [
    antigravity-cli
    codex
    gh
    gum
    home-manager
  ];
}