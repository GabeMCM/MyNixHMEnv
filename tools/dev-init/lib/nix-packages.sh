to_nix_pkg() {
  case "$1" in
    "Node")
      echo "pkgs.nodejs"
      ;;
    "Deno")
      echo "pkgs.deno"
      ;;
    "Go")
      echo "pkgs.go"
      ;;
    "Python")
      echo "pkgs.python"
      ;;
    "PostgreSQL")
      echo "pkgs.postgresql"
      ;;
    "SQLite")
      echo "pkgs.sqlite"
      ;;
  esac
}