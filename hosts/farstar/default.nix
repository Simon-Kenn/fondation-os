{outputs, ...}: {
  networking.hostName = "farstar";
  system.stateVersion = "24.05";

  imports =
    [
      ./hardware.nix
      ./disk.nix

      ../core

      ../users/leto

      ../common/systems/base-packages.nix

      #../common/hardware/audio.nix
      ../common/hardware/video.nix
      ../common/hardware/bluetooth.nix

      ../common/networking/network-manager.nix

      ../common/gaming

      #../common/services/jellyfin.nix
    ]
    ++ (builtins.attrValues outputs.nixosModules);

  fdt = {
    hardware = {
      audio.enable = true;
    };
  };
}
