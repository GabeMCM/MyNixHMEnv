#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/lib/nix-packages.sh"
source "$SCRIPT_DIR/generators/node.sh"
source "$SCRIPT_DIR/generators/deno.sh"
source "$SCRIPT_DIR/generators/go.sh"

runtime=$(gum choose \
    "Node" \
    "Go" \
    "Deno"
)

project_type=""

if [ "$runtime" = "Node" ]; then
  project_type=$(gum choose \
    "JavaScript" \
    "TypeScript"
  )
fi

create_git=false

if gum confirm "Inicializar repositório Git?"; then
  create_git=true
fi

extras=$(gum choose \
    --no-limit \
    "Node" \
    "Deno" \
    "Python" \
    "Go" \
    "PostgreSQL" \
    "SQLite" \
)

echo "---------------------"
echo "Runtime -> $runtime"
echo "---------------------"
echo "Extras: ["
echo "  ${extras//$'\n'/$'\n  '}"
echo "]"
echo "---------------------"

packages="$(to_nix_pkg "$runtime")"

while IFS= read -r extra; do
  [ -z "$extra" ] && continue

  packages+=$'\n'
  packages+="$(to_nix_pkg "$extra")"
done <<< "$extras"

if [ -e flake.nix ]; then
  gum style --foreground 1 "ERRO: já existe um flake.nix neste diretório."
  exit 1
fi

cat > flake.nix <<EOF
{
  description = "Ambiente de desenvolvimento";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.\${system};
    in
    {
      devShells.\${system}.default = pkgs.mkShell {
        packages = [
          ${packages//$'\n'/$'\n          '}
        ];
      };
    };
}
EOF

cat > .envrc <<'EOF'
use flake
EOF

case "$runtime" in
  "Node")
    create_node_project "$project_type" && create_node_gitignore
    ;;

  "Deno")
    create_deno_project && create_deno_gitignore
    ;;

  "Go")
    create_go_project && create_go_gitignore
    ;;
esac

if [ "$create_git" = true ]; then
  git init
fi

echo
gum style \
  --bold \
  "Ambiente criado!"

echo
echo "Próximo passo:"
echo "  direnv allow"