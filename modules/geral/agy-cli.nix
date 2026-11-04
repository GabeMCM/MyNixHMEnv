{ ... }:

{
  # Permite que o Home Manager baixe e gerencie o agy CLI
  programs.antigravity-cli = {
    enable = true;

    # Mantém o settings.json gravável no disco para permitir alterações pelo próprio CLI (/settings, troca de modelo, etc.)
    mutableSettings = true;

    # Define as configurações globais do CLI (~/.gemini/antigravity-cli/settings.json)
    settings = {
      theme = "dark";
      sandbox = true;
    };

    # Opcional: Adicione Skills customizadas diretamente pelo código Nix se desejar
    # skills = {
    #   meu-helper = ''
    #     ---
    #     name: meu-helper
    #     description: Gera automações locais rápidos
    #     ---
    #     Suas instruções customizadas em Markdown aqui...
    #   '';
    # };
  };
}
