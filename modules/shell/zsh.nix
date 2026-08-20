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

      buildnix = "nix build .#homeConfigurations.main.activationPackage";
      activenix = "./result/activate && exec zsh";
      buildactivenix = "nix build .#homeConfigurations.main.activationPackage && ./result/activate && exec zsh";
      hm = "home-manager switch --flake ~/.config/nix-config#main && exec zsh";
      hmbackup = "home-manager switch -b backup --flake ~/.config/nix-config#main && exec zsh";
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      setopt HIST_REDUCE_BLANKS
      setopt AUTO_CD

      export PATH="$HOME/.cargo/bin:$PATH"

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
