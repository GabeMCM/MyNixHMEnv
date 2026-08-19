{ ... }:

{
  imports = [
    ./modules/shell/zsh.nix
    ./modules/shell/starship.nix

    ./modules/cli/tools.nix
    ./modules/cli/git.nix
	  ./modules/cli/direnv.nix
	    
    ./modules/apps/vscode.nix
	  ./modules/apps/pkgs.nix

    ./modules/dev-init.nix
  ];

  home.username = "caspgestec";
  home.homeDirectory = "/home/caspgestec";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  targets.genericLinux.enable = true;

  home.stateVersion = "25.05";
  
}
