{ pkgs, ... }: {

  # Permite que o Home Manager baixe e gerencie o agy CLI
  programs.antigravity-cli = {
    enable = true;
    
    # Define as configurações globais do CLI (~/.gemini/antigravity-cli/settings.json)
    settings = {
      theme = "dark";
      # Força a sandbox caso use Linux convencional, ou mude para false se houver falhas no NixOS
      sandbox = true; 
    };

    # Opcional: Adicione Skills customizadas diretamente pelo código Nix se desejar
    skills = {
      meu-helper = ''
        description = 'Gera automações locais rápidos'
        # Suas instruções customizadas em Markdown de MCP aqui...
      '';
    };
  };
}
