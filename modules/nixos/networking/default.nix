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
    };

    environment.persistence."/persist".directories = [
      "/etc/NetworkManager"
    ];
  };
}
