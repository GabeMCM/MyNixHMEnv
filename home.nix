{ username, homeDirectory, ... }:

{
  imports = [
    ./modules/shell/zsh.nix
    ./modules/shell/starship.nix
    ./modules/shell/tools.nix

    ./modules/geral/git.nix
    ./modules/geral/agy-cli.nix
	  ./modules/geral/direnv.nix
    ./modules/geral/vscode.nix
	  ./modules/geral/pkgs.nix
    ./modules/geral/gh.nix

    ./modules/dev-init.nix
  ];

  home.username = username;
  home.homeDirectory = homeDirectory;

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  targets.genericLinux.enable = true;

  home.stateVersion = "25.05";
  
}
