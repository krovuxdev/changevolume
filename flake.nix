{
  description = "Proyecto changevolume";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (nixpkgs) lib;
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    eachSystems = lib.genAttrs systems;
    forSystem = eachSystems (
      system: let
        Pkgs = import nixpkgs {inherit system;};
      in
        Pkgs
        // {
          changevolume = import ./Changevolume/default.nix {
            inherit system;
            pkgs = Pkgs;
          };
        }
    );
  in {
    packages = eachSystems (system: {
      changevolume = forSystem.${system}.changevolume;
    });
    home-manager = {
      default = import ./Changevolume/changevolume.nix self;
      changevolume = import ./Changevolume/changevolume.nix self;
    };
    homeManagerModules = {
      default = import ./Changevolume/changevolume.nix self;
      changevolume = import ./Changevolume/changevolume.nix self;
    };
    nixosModules = {
      default = import ./Changevolume/changevolume.nix self;
      changevolume = import ./Changevolume/changevolume.nix self;
    };
    nixosConfigurations = {
      default = import ./Changevolume/changevolume.nix self;
      changevolume = import ./Changevolume/changevolume.nix self;
    };


    checks = eachSystems (system: self.packages.${system});
    formatter = eachSystems (system: forSystem.${system}.alejandra);
  };
}
