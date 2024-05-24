{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.services.nixarr.sonarr;
  defaultPort = 8989;
  nixarr = config.fdn.services.nixarr;
in {
  options.fdn.services.nixarr.sonarr = {
    enable = mkEnableOption "the sonarr service.";

    stateDir = mkOption {
      type = types.path;
      default = "${nixarr.stateDir}/sonarr";
    };
  };

  config = mkIf cfg.enable {
    services.sonarr = {
      enable = cfg.enable;
      user = "sonarr";
      group = "media";
      openFirewall = true;
      dataDir = cfg.stateDir;
    };
  };
}
