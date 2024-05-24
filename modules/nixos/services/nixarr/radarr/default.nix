{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.services.nixarr.radarr;
  defaultPort = 7878;
  nixarr = config.fdn.services.nixarr;
in {
  options.fdn.services.nixarr.radarr = {
    enable = mkEnableOption "the radarr service.";

    stateDir = mkOption {
      type = types.path;
      default = "${nixarr.stateDir}/radarr";
    };
  };

  config = mkIf cfg.enable {
    services.radarr = {
      enable = cfg.enable;
      user = "radarr";
      group = "media";
      openFirewall = true;
      dataDir = cfg.stateDir;
    };
  };
}
