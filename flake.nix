{
  description = "Meu ambiente pessoal";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      username = "capgestec";
      homeDirectory = "/home/${username}";

      pkgs = import nixpkgs {
        inherit system;

        config = {
          allowUnfree = true;
        };
      };
      mkHome = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit username homeDirectory;
        };

        modules = [
          ./home.nix
        ];
      };
    in
    {
      homeConfigurations = {
        main = mkHome;
        ${username} = mkHome;
      };
    };
}
