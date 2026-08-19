create_deno_project() {
  mkdir -p src

  cat > deno.json <<'EOF'
{
  "tasks": {
    "dev": "deno run --watch src/main.ts",
    "start": "deno run src/main.ts",
    "check": "deno check src/main.ts"
  }
}
EOF

  cat > src/main.ts <<'EOF'
console.log("Deno");
EOF
}

create_deno_gitignore() {
  cat > .gitignore <<'EOF'
.env
.direnv/
EOF
}