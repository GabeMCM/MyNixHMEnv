{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreAllDups = true;
      findNoDups = true;
      share = true;
    };

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      cls = "clear";

      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline --graph --decorate";

      ns = "nix search nixpkgs";
      hmconfig = "cd ~/.config/home-manager";
      zshconfig = "micro ~/.config/home-manager/modules/shell/zsh.nix";

      gh alias set iclone "!gh repo list --limit 100 --json nameWithOwner --jq '.[].nameWithOwner' | fzf | xargs -I {} gh repo clone {}";
	  
      buildnix = "nix build .#homeConfigurations.main.activationPackage";
      activenix = "./result/activate && exec zsh";
      buildactivenix = "nix build .#homeConfigurations.main.activationPackage && ./result/activate && exec zsh";
      hm = "home-manager switch --flake ~/.config/home-manager#main && exec zsh";
      hmbackup = "home-manager switch -b backup --flake ~/.config/home-manager#main && exec zsh";
      hmup = "nix flake update --flake ~/.config/home-manager && home-manager switch --flake ~/.config/home-manager#main && exec zsh";
      hmgc = "nix-collect-garbage -d";
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      setopt HIST_REDUCE_BLANKS
      setopt AUTO_CD

      gsave() {
        if [ -z "$1" ]; then
          echo "Uso: gsave \"mensagem do commit\""
          return 1
        fi

        git add .
        git commit -m "$*"
        git push
      }
    '';
  };
}
