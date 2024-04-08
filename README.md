## Installation

### Build custom iso

- `sudo nix build .#nixosConfigurations.iso.config.system.build.isoImage`
- `sudo cp result/iso/nixos-xxx.iso /dev/sdX`
```

### Partition and installation

- `sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko --flake .#farstar`
- `sudo nixos-install --flake .#farstar`
