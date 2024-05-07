{
  pkgs,
  lib,
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../core/catppuccin.nix
    ../core/fish.nix
    ../core/locale.nix
    ../core/nix.nix
  ];

  networking = {
    hostName = "iso";
    networkmanager.enable = true;
    wireless.enable = false;
  };

  users.extraUsers.root.password = "nixos";
  users.users.nixos = {
    packages = [pkgs.home-manager];
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  services = {
    openssh.settings.PermitRootLogin = lib.mkForce "yes";
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = lib.mkForce ["btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs"];
  };
}
