{ config, pkgs, ... }:

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
		 };
	};
}