{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.os.hardware.networking;
in {
  options.os.hardware.networking = {
    enable = mkEnableOption "Enable networkmanager";
  };

  config = mkIf cfg.enable {
    networking.firewall = {
      #enable = true;
    };

    networking.networkmanager.enable = true;

    environment.persistence."/persist".directories = [
      "/etc/NetworkManager"
    ];
  };
}


