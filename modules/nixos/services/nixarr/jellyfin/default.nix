{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.services.nixarr.jellyfin;
  defaultPort = 8096;
  nixarr = config.fdn.services.nixarr;
in {
  options.fdn.services.nixarr.jellyfin = {
    enable = mkEnableOption "the Jellyfin service.";

    stateDir = mkOption {
      type = types.path;
      default = "${nixarr.stateDir}/jellyfin";
      example = "/data/.state/jellyfin";
      description = "The location for the state directory for the Jellyfin service.";
    };

    openFirewall = mkOption {
      type = types.bool;
      default = true;
      description = "Open firewall for Jellyfin";
    };
  };

  config = mkIf cfg.enable {
    systemd.tmpfiles.rules = [
      "d '${cfg.stateDir}' 0700 streamer root - -"
    ];

    services.jellyfin = {
      #inherit (cfg.enable) enable;
      enable = true;
      user = "streamer";
      group = "media";
      #inherit (cfg.openFirewall) openFirewall;
      openFirewall = true;
      logDir = "${cfg.stateDir}/log";
      cacheDir = "${cfg.stateDir}/cache";
      dataDir = "${cfg.stateDir}/data";
      configDir = "${cfg.stateDir}/config";
    };
  };
}
