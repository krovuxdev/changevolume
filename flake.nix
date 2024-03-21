{
  description = "Proyecto changevolume";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules = {
        changevolume = import ./Changevolume/changevolume.nix;
        home-manager = import ./Changevolume/changevolume.nix ;
        };
  };
}
