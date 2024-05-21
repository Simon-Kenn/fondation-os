{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.wireless;
in {
  options.wireless = {
    enable = mkEnableOption "Enable wireless";
  };

  config = mkIf cfg.enable {
    networking.wireless = {
      enable = true;
      networks = {
      };
      allowAuxiliaryImperativeNetworks = true;
      userControlled = {
        enable = true;
        group = "network";
      };
      extraConfig = ''
        update_config=1
      '';
    };

    users.groups.network = {};
    systemd.services.wpa_supplicant.preStart = "touch /etc/wpa_supplicant.conf";
  };
}
