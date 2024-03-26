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
    #pkgs = eachSystems (system: import nixpkgs {inherit system;});
  in {
    packages = eachSystems (system: {
      changevolume = forSystem.${system}.changevolume;
      #changevolume = import ./Changevolume/default.nix {
      #inherit pkgs;
      #pkgs = (system: import nixpkgs {inherit system;});
      #};
      #eachSystems.${system}.changevolumee
    });
    homeManagerModules = eachSystems (system: {
      changevolume = import ./Changevolume/changevolume.nix self;
    });
    nixosModules = {
      changevolume = import ./Changevolume/changevolume.nix self;
    };
    checks = eachSystems (system: self.packages.${system});
    formatter = eachSystems (system: forSystem.${system}.alejandra);
  };
}
