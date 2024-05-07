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
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  users.extraUsers.root.password = "nixos";

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
    };
  };

  fdn = {
    system = {
      catppuccin.enable = true;
      locale.enable = true;
      nix.enable = true;
    };

    user = {
      name = "nixos";
      initialPassword = "1";
    };
  };
}
