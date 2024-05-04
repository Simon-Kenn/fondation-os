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
    };
    hardware = {
      audio.enable = true;
    };
  };
}
