{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.services.nixarr;
in {
  imports = [
    ./calibre-web
    ./jellyfin
    ./bazarr
    ./lidarr
    ./prowlarr
    ./radarr
    ./sonarr
    ./readarr
  ];

  options.fdn.services.nixarr = {
    enable = mkEnableOption "Enable nixarr";

    mediaUsers = mkOption {
      type = types.listOf types.str;
      default = [];
      example = ["user"];
      description = ''
        Extra users to add to the media group.
      '';
    };

    mediaDir = mkOption {
      type = types.path;
      default = "/data/media";
      example = "/nixarr";
      description = ''
        The location of the media directory for the services.

        Be carefull, the path should be owned by root.
      '';
    };

    stateDir = mkOption {
      type = types.path;
      default = "/data/.state/nixarr";
      example = "/nixarr/.state";
      description = ''
        The location of the state directory for the services.

        Be carefull, the path should be owned by root.
      '';
    };
  };

  config = mkIf cfg.enable {
    users.groups = {
      media.members = cfg.mediaUsers;
      streamer = {};
      torrenter = {};
    };

    users.users = {
      streamer = {
        isSystemUser = true;
        group = "streamer";
      };
      torrenter = {
        isSystemUser = true;
        group = "torrenter";
      };
    };

    systemd.tmpfiles.rules = [
      "d '${cfg.mediaDir}'                        0775 root       media - -"
      "d '${cfg.mediaDir}/librairie'              0775 streamer   media - -"
      "d '${cfg.mediaDir}/librairie/series'       0775 streamer   media - -"
      "d '${cfg.mediaDir}/librairie/films'        0775 streamer   media - -"
      "d '${cfg.mediaDir}/librairie/musique'      0775 streamer   media - -"
      "d '${cfg.mediaDir}/librairie/livres'       0775 streamer   media - -"
      "d '${cfg.mediaDir}/torrents'               0775 torrenter  media - -"
      "d '${cfg.mediaDir}/torrents/.imcomplete'   0775 torrenter  media - -"
      "d '${cfg.mediaDir}/torrents/.watch'        0775 torrenter  media - -"
      "d '${cfg.mediaDir}/torrents/manual'        0775 torrenter  media - -"
      "d '${cfg.mediaDir}/torrents/lidarr'        0775 torrenter  media - -"
      "d '${cfg.mediaDir}/torrents/radarr'        0775 torrenter  media - -"
      "d '${cfg.mediaDir}/torrents/sonarr'        0775 torrenter  media - -"
      "d '${cfg.mediaDir}/torrents/readarr'       0775 torrenter  media - -"
      "d '${cfg.mediaDir}/torrents/bazarr'        0775 torrenter  media - -"
    ];

    environment.persistence."/persist" = {
      directories = [
        "${cfg.mediaDir}"
      ];
    };
  };
}
