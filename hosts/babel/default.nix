{
  networking.hostName = "farstar";
  system.stateVersion = "24.05";

  imports = [
    ./hardware.nix
    ./disk.nix

    ../core

    ../users/leto
    ../common/networking/network-manager.nix
  ];
}
