{
  lib,
  outputs,
  ...
}: {
  imports = builtins.attrValues outputs.nixosModules;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "iso";
    networkmanager.enable = true;
    wireless.enable = lib.mkForce false;
  };

  fdn = {
    system = {
      catppuccin.enable = true;
      locale.enable = true;
      nix.enable = true;
    };

    services.openssh.enable = true;

    users = {
      name = "nixos";
      initialPassword = "1";
    };
  };
}
