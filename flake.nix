
{
  description = "Klouwer's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations."thinkpad-x270" = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        specialArgs = { inherit inputs; };
        modules = [
          ./NixOS/hosts/thinkpad-x270/configuration.nix
          home-manager.nixosModules.home-manager
        ];
        home-manager.users.klouwer = import ./NixOS/home-manager/home.nix { inherit pkgs inputs; };
      };
    };
}
