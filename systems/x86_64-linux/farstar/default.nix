{outputs, ...}: {
  imports =
    [
      ./disk.nix
      ./hardware.nix
    ]
    ++ (builtins.attrValues outputs.nixosModules);

  fdn = {
    system = {
      boot = {
        enable = true;
        plymouth = true;
      };
      impermanence.enable = true;
    };
    hardware = {
      audio.enable = true;
    };
  };
}
