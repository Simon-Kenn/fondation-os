{outputs, ...}: {
  imports =
    [
      ./disk.nix
      ./hardware.nix
    ]
    ++ (builtins.attrValues outputs.nixosModules);

  fdt = {
    hardware = {
      audio.enable = true;
    };
  };
}
