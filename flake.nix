{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, nixos-wsl, ... }:
    {
      nixosConfigurations.lamb = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/common
          ./hosts/lamb/configuration.nix
          ./modules/system/i3
          ./modules/system/audio
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jack = import ./users/jack/home.nix;
            home-manager.sharedModules = [ nixvim.homeManagerModules.nixvim ];
          }
        ];
      };

      nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/common/packages
          ./hosts/wsl/configuration.nix
          nixos-wsl.nixosModules.wsl
        ];
      };

      nixosConfigurations.dev-vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/common
          ./hosts/dev-vm/configuration.nix
          ./modules/system/i3
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jack = import ./users/jack/home.nix;
            home-manager.sharedModules = [ nixvim.homeManagerModules.nixvim ];
          }
        ];
      };
    };
}
