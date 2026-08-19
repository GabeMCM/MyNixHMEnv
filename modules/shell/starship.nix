{ ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      add_newline = true;
      command_timeout = 800;

      palette = "graphite";

      format = '' [╭─](fg:muted)$os $username [](fg:dim) $directory $git_branch $git_status $golang $deno $nodejs $python $rust $custom $fill $cmd_duration $time $line_break[╰─](fg:muted) $character '';

      palettes.graphite = {
        fg = "#c9c9c9";
        muted = "#666666";
        dim = "#8a8a8a";
        bright = "#eeeeee";

        accent = "#9aa5ce";
        accent2 = "#8fbcbb";

        green = "#a3be8c";
        yellow = "#d8c38a";
        red = "#bf616a";
        blue = "#81a1c1";
        purple = "#b48ead";
      };

      os = {
        disabled = false;
        style = "fg:dim";
        format = "[$symbol]($style) ";

        symbols = {
          Fedora = "";
          Linux = "";
        };
      };

      username = {
        show_always = true;
        style_user = "fg:bright";
        style_root = "bold fg:red";
        format = "[]($style)";
      };

      directory = {
        style = "bold fg:bright";
        format = " [$path]($style) ";
        truncation_length = 4;
        truncate_to_repo = false;
        read_only = " ";

        substitutions = {
          Documents = "󰈙 docs";
          Downloads = " downloads";
          Pictures = " images";
          Projetos = "󰲋 projects";
          Projects = "󰲋 projects";
        };
      };

      git_branch = {
        symbol = " ";
        style = "fg:accent";
        format = " [$symbol$branch]($style)";
      };

      git_status = {
        style = "fg:yellow";
        format = "([$all_status$ahead_behind]($style)) ";

        conflicted = "󰞇 ";
        ahead = "⇡\${count} ";
        behind = "⇣\${count} ";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count} ";
        untracked = "?\${count} ";
        stashed = "󰏗 ";
        modified = "!\${count} ";
        staged = "+\${count} ";
        renamed = "»\${count} ";
        deleted = "✘\${count} ";
      };

      python = {
        symbol = " ";
        style = "fg:blue";
        format = " [$symbol$version]($style)";
      };

      rust = {
        symbol = " ";
        style = "fg:yellow";
        format = " [$symbol$version]($style)";
      };

      golang = {
        symbol = " ";
        style = "fg:blue";
        format = " [$symbol$version]($style)";
      };

      deno = {
        symbol = " ";
        style = "fg:accent2";
        format = " [$symbol$version]($style)";
      };

      nodejs = {
        symbol = " ";
        style = "fg:green";
        format = " [$symbol$version]($style)";
      };

      custom.gpu = {
        command = "printf NVIDIA";
        when = "command -v nvidia-smi >/dev/null 2>&1";
        symbol = "󰢮 ";
        style = "fg:accent2";
        format = " [$symbol$output]($style)";
        shell = [ "sh" ];
      };

      fill.symbol = " ";

      cmd_duration = {
        min_time = 1500;
        style = "fg:dim";
        format = "[󰔟 $duration]($style) ";
      };

      time = {
        disabled = false;
        time_format = "%H:%M";
        style = "fg:muted";
        format = "[ $time]($style)";
      };

      character = {
        success_symbol = "[❯](bold fg:accent2)";
        error_symbol = "[❯](bold fg:red)";
        vimcmd_symbol = "[❮](bold fg:accent)";
      };
    };
  };
}