{outputs, ...}: {
  imports =
    [
      ./disk.nix
      ./hardware.nix
    ]
    ++ (builtins.attrValues outputs.nixosModules);

  fdn = {
    hardware = {
      audio.enable = true;
    };
  };
}
