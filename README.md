## changevolume in dunst
## Bienvenido a nuestro proyecto volumen | Welcome to our Volume Project

![fotos](img/volume.png)

![fotos](img/muted.png)

# 👇 Aqui esta la guia | Here is the guide 👇
## En Cualquier linux distro | On any Linux distro

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

## En nixos | in Nixos
```nix
#flake.nix
{
  inputs = {
     changevolume = {
            url = "github:krovuxdev/changevolume";
            inputs.nixpkgs.follows = "nixpkgs";
    };
  outputs = {
  ... # <-- Ajusta esta sección según tus necesidades específicas
            #Adjust this section to your specific needs  
  changevolume # <--- Agrega el módulo changevolume para importarlo en la configuración de NixOS
                      #Add the changevolume module to import into NixOS settings
  }@inputs: {
    nixosConfigurations = {
      host = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ... # <-- Ajusta esta sección según tus necesidades específicas
                    #Adjust this section to your specific needs  
          home-manager.nixosModules.home-manager
          {
            ... # <-- Ajusta esta sección según tus necesidades específicas
                      #Adjust this section to your specific needs  
            home-manager.extraSpecialArgs = {
            ... # <-- Ajusta esta sección según tus necesidades específicas
                      #Adjust this section to your specific needs  
            changevolume = changevolume.nixosModules.changevolume; # <--- # Importa el módulo changevolume para NixOS
                                                                          # Import the changevolume module for NixOS
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
      #     Adjust this section to your specific needs
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
