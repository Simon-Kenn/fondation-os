{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.services.nixarr.lidarr;
  defaultPort = 8686;
  nixarr = config.fdn.services.nixarr;
in {
  options.fdn.services.nixarr.lidarr = {
    enable = mkEnableOption "the lidarr service.";

    stateDir = mkOption {
      type = types.path;
      default = "${nixarr.stateDir}/lidarr";
    };
  };

  config = mkIf cfg.enable {
    services.lidarr = {
      enable = cfg.enable;
      user = "lidarr";
      group = "media";
      openFirewall = true;
      dataDir = cfg.stateDir;
    };
  };
}
