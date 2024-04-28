{
  pkgs,
  config,
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users.users.leto = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = ["wheel" "network" "git"];
    packages = [pkgs.home-manager];
    initialPassword = "password";
    #hashedPasswordFile =
  };

  home-manager = {
    users.leto = import ../../../home/leto/${config.networking.hostName}.nix;
    extraSpecialArgs = {
      inherit inputs outputs;
    };
  };

  security.pam.services = {
    swaylock = {};
  };
}
