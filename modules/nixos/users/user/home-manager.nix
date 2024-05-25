{
  inputs,
  outputs,
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.fdn.user.home-manager;
in {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  options.fdn.user.home-manager = {
    enable = mkEnableOption "Enable home-manager";
  };

  config = mkIf cfg.enable {
    users.users.leto.packages = [pkgs.home-manager];

    home-manager = {
      users.leto = import ../../../../home/leto/farstar.nix;
      extraSpecialArgs = {
        inherit inputs outputs;
      };
      #useGlobalPkgs = true;
      #useUserPackages = true;
    };
  };
}
