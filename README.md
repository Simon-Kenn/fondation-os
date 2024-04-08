## Installation

### Build custom iso

```bash
sudo nix build .#nixosConfigurations.iso.config.system.build.isoImage
sudo cp result/iso/nixos-xxx.iso /dev/sdX
```

### Partioning

`sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko --flake .#farstar`
