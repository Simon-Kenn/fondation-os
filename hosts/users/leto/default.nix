{
  pkgs,
  config,
  ...
}: {
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
  };

  security.pam.services = {
    swaylock = {};
  };
}
