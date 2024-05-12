{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.fdn.services.servarr;
in {
  options.fdn.services.servarr = {
    enable = mkEnableOption "Enable servarr services";
  };

  config = mkIf cfg.enable {
    services = {
      sonnar = {
        enable = true;
      };
      bazarr = {
        enable = true;
      };
      lidarr = {
        enable = true;
      };
      prowlarr = {
        enable = true;
      };
      radarr = {
        enable = true;
      };
      readarr = {
        enable = true;
      };
    };

    environment.persistence."/persist" = {
      directories = [
        "/var/lib/sonarr/bazarr"
        "/var/lib/lidarr"
        "/var/lib/private/prowlarr"
        "/var/lib/radarr"
        "/var/lib/readarr"
        "/var/lib/sonarr"
      ];
    };
  };
}
