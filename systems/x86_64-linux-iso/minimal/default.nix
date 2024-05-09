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

  users.extraUsers.root = {
    password = "nixos";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGvp/TdTeIuLKSk1/NWi+U0tP2pF1pdbQxD5UwaEtT4Z leto@farstar"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHlkGcpz4YPfrxG/Yc/wgX29gk20X/VFoXUcm8vwR/7E root@farstar"
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
      initialPassword = "1";
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
