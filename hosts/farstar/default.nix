{outputs, ...}: {
  networking.hostName = "farstar";
  system.stateVersion = "24.05";

  imports = [
    ../users/leto
    ../core

    ../common/systems/base-packages.nix

    ../common/hardware/audio.nix
    ../common/hardware/video.nix
    ../common/hardware/bluetooth.nix

    ../common/networking/network-manager.nix

    ../common/gaming

    #../common/services/jellyfin.nix
    ../../systems/x86_64-linux/farstar
  ];
}
