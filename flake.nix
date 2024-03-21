{
  description = "Proyecto changevolume";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosModules = {
        changevolume = {
            #system = "x86_64-linux";
            modules = import ./Changevolume/changevolume.nix;
        };    
  };
  };
}
