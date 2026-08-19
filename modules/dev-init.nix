{ ... }:

{
  home.file.".local/share/dev-init" = {
    source = ../tools/dev-init;
    recursive = true;
  };

  home.file.".local/bin/dev-init" = {
    executable = true;

    text = ''
      #!/usr/bin/env bash
      exec bash "$HOME/.local/share/dev-init/dev-init.sh" "$@"
    '';
  };
}