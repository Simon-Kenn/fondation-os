{
  config,
  lib,
  ...
}: {
  boot = {
    initrd = {
      availableKernelModules = ["xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
      kernelModules = ["amdgpu"];
    };
  };

  networking.useDHCP = lib.mkDefault false;
  networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
