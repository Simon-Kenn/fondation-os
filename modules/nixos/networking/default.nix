{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.fdn.networking;
in {
  options.fdn.networking = {
    enable = mkEnableOption "Enable networking";
  };

  config = mkIf cfg.enable {
    networking = {
      firewall.enable = true;
      networkmanager.enable = true;
      hosts = {
        "192.168.0.2" = ["babel.local"];
      };
    };

    environment.persistence."/persist".directories = [
      "/etc/NetworkManager"
    ];
  };
}
