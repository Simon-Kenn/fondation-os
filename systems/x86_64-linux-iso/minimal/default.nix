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

  users.users.root = {
    initialPassword = "nixos";
    openssh.authorizedKeys.keyFiles = [
      ../../../home/leto/ssh.pub
    ];
  };

  fdn = {
    system = {
      catppuccin.enable = true;
      locale.enable = true;
      nix.enable = true;
    };

    user = {
      name = "nixos";
      initialPassword = "nixos";
    };

    services = {
      openssh = {
        enable = true;
        PermitRootLogin = "yes";
        PasswordAuthentication = false;
      };
      avahi.enable = true;
    };
  };
}
