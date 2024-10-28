{
lib,
outputs,
self,
pkgs,
...
}: {
  imports = builtins.attrValues outputs.nixosModules;

  isoImage = {
    isoName = "yubikeyLive.iso";
    squashfsCompression = "zstd";

    appendToMenuLabel = " YubiKey Live ${self.lastModifiedDate}";
    makeEfiBootable = true; # EFI booting
    makeUsbBootable = true; # USB booting
  };

  swapDevices = [];

  services = {
    pcscd.enable = true;
    udev.packages = [pkgs.yubikey-personalization];
    getty.autologinUser = "nixos";

  };

}
