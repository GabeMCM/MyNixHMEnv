{ config, pkgs, ... }:

{
  programs.eza = {
    enable = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    ripgrep
		micro
  ];

  programs.zsh.shellAliases = {
    ls = "eza";
    l = "eza -lah --icons";
    ll = "eza -lh --icons";
    la = "eza -la --icons";
    lt = "eza --tree --icons --level=2";

    cat = "bat";
    grep = "rg";
  };
}