{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  
  home.packages = with pkgs; [
    codex
    gum
    tailscale
    go
    sqlite
    nerd-fonts.jetbrains-mono
  ];
}
