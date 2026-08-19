{ pkgs, ... }:

{
  # --- CONFIGURAÇÃO DO GITHUB CLI ---
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
      editor = "micro";
      prompt = "enabled";
      prefer_editor_prompt = "disabled";

      aliases = {
        co = "pr checkout";
      };
    };
  };

  # --- CONFIGURAÇÃO AUTOMÁTICA DO SSH ---
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "github.com" = {
        HostName = "github.com";
        User = "GabeMCM";
        # ssh-keygen -t ed25519 -C "email@gmail.com" 
        IdentityFile = "~/.ssh/id_ed25519"; 
        IdentitiesOnly = true;
      };
    };
  };
}
 