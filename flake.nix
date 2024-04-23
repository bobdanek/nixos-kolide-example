{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    kolide-launcher = {
      url = "github:/kolide/nix-agent/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self,
    nixpkgs,
    kolide-launcher,
    ...
  }: with inputs;
  let
    nixpkgsConfig = { overlays = []; };
  in {
    nixosConfigurations.laptop_hostname = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        kolide-launcher.nixosModules.kolide-launcher
        { nixpkgs.config.allowUnfree = true; }
      ];
      specialArgs = { 
        inherit inputs; 
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };
    };
  };
}
