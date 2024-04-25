{
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./boot.nix
    ./ephemeral-btrfs.nix
    ./firewall.nix
    ./fish.nix
    ./impermanence.nix
    ./locale.nix
    ./nix.nix
    ./openssh.nix
    ./sops.nix
    ./system-initrd.nix
  ];

  home-manager.extraSpecialArgs = {
    inherit inputs outputs;
  };
}
