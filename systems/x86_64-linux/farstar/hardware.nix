{
  config,
  lib,
  pkgs,
  ...
}: {
  boot = {
    initrd = {
      availableKernelModules = ["xhci_pci" "ahci" "usb_storage" "sd_mod"];
    };
    kernelModules = ["kvm-intel"];
    kernelPackages = pkgs.linuxPackages_latest;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    enableRedistributableFirmware = true;
  };
}
