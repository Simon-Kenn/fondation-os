{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.services.paperless;
  defaultPort = 8000;
in {
  options.fdn.services.paperless = {
    enable = mkEnableOption "the paperless service.";
  };

  config = mkIf cfg.enable {
    services.paperless = {
      enable = cfg.enable;
      mediaDir = "/data/paperless";
      dataDir = "/data/.state/dataDir";
      user = "paperless";
      #      port = defaultPort;
    };

    networking.firewall = {
      allowedUDPPorts = [defaultPort];
    };
  };
}
