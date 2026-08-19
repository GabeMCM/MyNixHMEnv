create_go_project() {
  local module_name="${1:-$(basename "$PWD")}"

  cat > go.mod <<EOF
module $module_name
EOF

  cat > main.go <<'EOF'
package main

import "fmt"

func main() {
	fmt.Println("Go")
}
EOF
}

create_go_gitignore() {
  cat > .gitignore <<'EOF'
node_modules/
dist/
.env
.direnv/
EOF
}
