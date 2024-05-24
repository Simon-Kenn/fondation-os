{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.services.nixarr.calibre-web;
  defaultPort = 8083;
  nixarr = config.fdn.services.nixarr;
in {
  options.fdn.services.nixarr.calibre-web = {
    enable = mkEnableOption "the calibre-web service.";

    stateDir = mkOption {
      type = types.path;
      default = "${nixarr.stateDir}/calibre-web";
    };
  };

  config = mkIf cfg.enable {
    services.calibre-web = {
      enable = cfg.enable;
      user = "calibre-web";
      group = "media";
      openFirewall = true;
      listen.port = defaultPort;
      dataDir = cfg.stateDir;
      options = {
        calibreLibrary = "${nixarr.mediaDir}/librairie/livres";
      };
    };
  };
}
