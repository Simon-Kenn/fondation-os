{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.fdn.services.homepage-dashboard;
in {
  options.fdn.services.homepage-dashboard = {
    enable = mkEnableOption "Enable homepage-dashboard";
  };

  config = mkIf cfg.enable {
    services.homepage-dashboard = {
      enable = true;

      listenPort = 8082;
      openFirewall = true;

      settings = {
        title = "Babel";
        theme = "dark";
        layout = {
        };
      };

      widgets = [
        {
          greeting = {
            text_size = "xl";
            text = "Bonjour Leto";
          };
        }
        {
          datetime = {
            text_size = "xl";
            format = {
              timeStyle = "short";
            };
          };
        }
      ];

      services = [
        {
          "Media" = [
            {
              "Jellyfin" = {
                description = "Séries et films parfaitement illégale en illimité !";
                href = "http://babel:8096";
                icon = "jellyfin";
                #widget = {
                #  type = "jellyfin";
                #  url = "http://babel:8096";
                #  key = "5f56cbf7cf504105b8ba23e08eb1ffc6";
                #};
              };
            }
            {
              "Calibre" = {
                description = "Biblothèque en ligne";
                href = "http://babel:8083";
                icon = "calibre-web";
                #widget = {
                #  type = "calibreweb";
                #  url = "http://babel:8083";
                #  username = "admin";
                #  password = "admin123";
                #};
              };
            }
            #{
            #  "Deluge" = {
            #    description = "Qu'internet me le donne";
            #    href = "http://babel:8112";
            #    icon = "deluge";
            #  };
            #}
            {
              "Prowlarr" = {
                descrpition = "Indexing .arr";
                href = "http://babel:9696";
                icon = "prowlarr";
                #widget = {
                #  type = "prowlarr";
                #  url = "http://babel:9696";
                #  key = "21124d60d2164799b75e4dd479832245";
                #};
              };
            }
            {
              "Radarr" = {
                description = "Collection de film ultra légale";
                href = "http://babel:7878";
                icon = "radarr";
                #widget = {
                #  type = "radarr";
                #  url = "http://babel:7878";
                #  api = "3d16602fe28a43f7915163aafcfd0d7a";
                #};
              };
            }
            {
              "Sonnarr" = {
                description = "Collection de séries parfaitement légales";
                href = "http://babel:8989";
                icon = "sonarr";
              };
            }
            {
              "Lidarr" = {
                description = "Collection de musique parfaitement légale";
                href = "http://babel:8686";
                icon = "lidarr";
              };
            }
            {
              "Readarr" = {
                description = "Collection de livres parfaitement légales";
                href = "http://babel:8787";
                icon = "readarr";
              };
            }
            {
              "Bazarr" = {
                description = "Collection de sous-titre pour Sonarr et Radarr";
                href = "http://babel:6767";
                icon = "bazarr";
              };
            }
          ];
        }
        {
          "Productivité" = [
            {
              "Paperless" = {
                icon = "paperless";
                href = "http://babel:8000";
              };
            }
          ];
        }
      ];
    };
  };
}
