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
      sonarr = {
        enable = true;
        openFirewall = true;
      };
      bazarr = {
        enable = true;
        openFirewall = true;
      };
      lidarr = {
        enable = true;
        openFirewall = true;
      };
      prowlarr = {
        enable = true;
        openFirewall = true;
      };
      radarr = {
        enable = true;
        openFirewall = true;
      };
      readarr = {
        enable = true;
        openFirewall = true;
      };
    };

    environment.persistence."/persist" = {
      directories = [
        "/var/lib/sonarr"
        "/var/lib/bazarr"
        "/var/lib/lidarr"
        "/var/lib/private/prowlarr"
        "/var/lib/radarr"
        "/var/lib/readarr"
      ];
    };
  };
}
