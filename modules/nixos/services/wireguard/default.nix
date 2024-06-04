{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.services.wireguard;
in {
  imports = [
    ./server.nix
    ./client.nix
  ];
  options.fdn.services.wireguard = {
    enable = mkEnableOption "tailscale";
    client = mkEnableOption "enable client part";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [pkgs.wireguard-tools];

    #wireguard-utils.client = mkIf cfg.client {enable = true;};

    #wireguard-utils.server = mkIf (! cfg.client) {enable = true;};
  };
}
