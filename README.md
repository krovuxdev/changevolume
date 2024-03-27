## changevolume in dunst
## Bienvenido a nuestro proyecto volumen | Welcome to our Volume Project

![fotos](img/volume.png)

![fotos](img/muted.png)

# 👇 Aqui esta la guia | Here is the guide 👇
## En Cualquier linux distro

#1
```bash
git clone https://github.com/karimdev96/changevolume.git
```
#2
```bash
cd changevolume
```
#3
```bash
chmod +x install
chmod +x uninstall
```
### como intalar **changevolume** | How  install **changevolume**
<!-- # install -->
```bash
sudo ./install
```

## En nixos
```nix
#flake.nix
{
  inputs = {
     changevolume = {
            url = "github:krovuxdev/changevolume";
            inputs.nixpkgs.follows = "nixpkgs";
    };
  outputs = {
  ... #<-- Aquí puedes incluir tus módulos o cualquier otra configuración necesaria
  changevolume # <--- Agrega el módulo changevolume para importarlo en la configuración de NixOS
  }@inputs: {
    nixosConfigurations = {
      host = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ... # <-- Ajusta esta sección según tus necesidades específicas
          home-manager.nixosModules.home-manager
          {
            ... # <-- Ajusta esta sección según tus necesidades específicas
            home-manager.extraSpecialArgs = {
            ... # <-- Ajusta esta sección según tus necesidades específicas
            changevolume = changevolume.nixosModules.changevolume; # <--- # Importa el módulo changevolume para NixOS
            };
          }
        ];
      };
    };
  };
}
```
```nix
#home.nix
{
  pkgs,
  config,
  changevolume
}: {
  imports = [  changevolume  ];
  programs.changevolume.enable = true;
  ... # <-- Ajusta esta sección según tus necesidades específicas
}
```


## or
### como desintalar changevolume | How Uninstall changevolume
# uninstall 
```bash
sudo ./uninstall
```
<!-- ### debe instalar pamixer para que pueda ejecutar changevolume -->
### Requisitos y utilidad | Requirements & utility
- pamixer
```bash
sudo pacman -S pamixer
```

### Ahora puedes comenzar a usar ChangeVolume | Now can start using changevolume
# command
```bash
changevolume --help
```
