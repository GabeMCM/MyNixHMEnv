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

      ghclone = "gh repo list --limit 100 --json nameWithOwner --jq '.[].nameWithOwner' | fzf | xargs -I {} gh repo clone {}";
	  
      buildnix = "nix build .#homeConfigurations.main.activationPackage";
      activenix = "./result/activate && exec zsh";
      buildactivenix = "nix build .#homeConfigurations.main.activationPackage && ./result/activate && exec zsh";
      hm = "home-manager switch --flake ~/.config/home-manager#main && exec zsh";
      hmbackup = "home-manager switch -b backup --flake ~/.config/home-manager#main && exec zsh";
      hmup = "nix flake update --flake ~/.config/home-manager && home-manager switch --flake ~/.config/home-manager#main && exec zsh";
      hmgc = "nix-collect-garbage -d";

      apti = "aptin";
      aptfzf = "aptin";
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

      aptin() {
        if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
          echo "Uso: aptin [termo]"
          echo "  Pesquisa pacotes APT com fzf (seleção múltipla com Tab) e instala via sudo apt install."
          return 0
        fi

        local query="$*"
        local pkgs
        pkgs=$(apt-cache search "$query" | fzf -m \
          --prompt="📦 Pacotes APT > " \
          --header="[Tab: marca/desmarca | Enter: instala | Esc: cancela]" \
          --preview 'apt-cache policy {1} && echo "---" && apt-cache show {1}' \
          --preview-window=right:60%:wrap | awk '{print $1}')

        if [ -n "$pkgs" ]; then
          echo "📦 Instalando: $(echo $pkgs | tr '\n' ' ')"
          sudo apt install $(echo $pkgs)
        fi
      }
    '';
  };
}
