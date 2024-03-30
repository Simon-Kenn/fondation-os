## Installation

### Iso

```bash
sudo nix build .#nixosConfigurations.iso.config.system.build.isoImage
sudo cp result/iso/nixos-xxx.iso /dev/sdX
```
