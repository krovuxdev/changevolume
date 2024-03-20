{
  description = "Proyecto changevolume";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    packages = {
        changevolume = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./Changevolume
            ];
        };
    };
  };
}
