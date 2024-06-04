{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.wireguard-utils.client;
in {
  options.wireguard-utils.client = {
    enable = mkEnableOption "client side wireguard";
  };

  config = mkIf cfg.enable {
    networking = {
      wireguard = {
        interfaces = {
          wg0 = {
            ips = ["10.100.0.2/24"];
            listenPort = 51820;

            privateKeyFile = config.sops.wireguard-client.path;
          };
        };
      };
    };
  };
}
