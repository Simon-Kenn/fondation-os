{
  inputs,
  outputs,
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.users.home-manager;
in {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  options.fdn.users.home-manager = {
    enable = mkEnableOption "Enable home-manager";
  };

  config = mkIf cfg.enable {
    home-manager = {
      users.leto = import ../../../home/leto/${config.networking.hostName}.nix;
      extraSpecialArgs = {
        inherit inputs outputs;
      };
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}
