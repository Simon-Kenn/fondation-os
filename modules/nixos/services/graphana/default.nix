{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.services.grafana;
in {
  options.fdn.services.grafana = {
    enable = mkEnableOption "grafana";
  };

  config = mkIf cfg.enable {
    services.grafana = {
      enable = true;
      dataDir = /data/.state/grafana;
      server.http_port = 3000;
      users.default_theme = "system";
    };
  };
}
