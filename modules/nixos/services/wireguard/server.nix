{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.wireguard-utils.server;
in {
  options.wireguard-utils.server = {
    enable = mkEnableOption "wireguard-utils server";
  };

  config = mkIf cfg.enable {
    networking = {
      nat = {
        enable = true;
        externalInterface = "eth0";
        internalInterfaces = ["wg0"];
      };

      firewall = {
        allowedUDPPorts = [51820];
      };

      wireguard = {
        interfaces = {
          wg0 = {
            ips = [10.100.0.1/24];
            listenPort = 51820;

            postSetup = ''
              ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
            '';

            postShutdown = ''
              ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
            '';

            # private kKeyFile = "";

            peers = [
              {
                pulicKey = "D5eDAs94Z0IL3WTqc1fPfTrNqqawMJQKVP6I+xko+FI=";
                allowedIDs = ["10.100.0.2/32"];
              }
            ];
          };
        };
      };
    };
  };
}
