create_node_project() {
  local project_type="$1"

  mkdir -p src

  if [ "$project_type" = "TypeScript" ]; then
    cat > package.json <<'EOF'
{
  "name": "node-ts-project",
  "version": "0.1.0",
  "private": true,
  "type": "module",
  "scripts": {
    "dev": "tsx watch src/index.ts",
    "build": "tsc",
    "start": "node dist/index.js",
    "typecheck": "tsc --noEmit"
  },
  "devDependencies": {
    "@types/node": "^24",
    "tsx": "^4",
    "typescript": "^5"
  }
}
EOF

    cat > tsconfig.json <<'EOF'
{
  "compilerOptions": {
    "target": "ES2024",
    "module": "NodeNext",
    "moduleResolution": "NodeNext",
    "rootDir": "./src",
    "outDir": "./dist",
    "strict": true,
    "skipLibCheck": true
  },
  "include": ["src/**/*.ts"]
}
EOF

    cat > src/index.ts <<'EOF'
console.log("Node + TypeScript");
EOF

  else
    cat > package.json <<'EOF'
{
  "name": "node-project",
  "version": "0.1.0",
  "private": true,
  "type": "module",
  "scripts": {
    "dev": "node --watch src/index.js",
    "start": "node src/index.js"
  }
}
EOF

    cat > src/index.js <<'EOF'
console.log("Node");
EOF
  fi
}

create_node_gitignore() {
  cat > .gitignore <<'EOF'
node_modules/
dist/
.env
.direnv/
EOF
}