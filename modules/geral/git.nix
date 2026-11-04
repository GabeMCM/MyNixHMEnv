{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "GabeMCM";
        email = "gabrielmateuscm@gmail.com";
      };

      init = {
        defaultBranch = "main";
      };

      core = {
        editor = "micro";
      };

      pull = {
        rebase = false;
      };

      credential = {
        "https://github.com" = {
          helper = [
            ""
            "!gh auth git-credential"
          ];
        };
        "https://gist.github.com" = {
          helper = [
            ""
            "!gh auth git-credential"
          ];
        };
      };
    };
  };
}