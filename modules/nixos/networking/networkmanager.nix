{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.networkmanager;
in {
  options.networkmanager = {
    enable = mkEnableOption "Enable networkmanager";
  };

  config = mkIf cfg.enable {
    networking.networkmanager.enable = true;

    environment.persistence."/persist".directories = [
      "/etc/NetworkManager"
    ];
  };
}
