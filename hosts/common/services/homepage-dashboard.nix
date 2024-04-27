{
  services.homepage-dashboard = {
    enable = true;

    settings = {
      title = "Babel";
      theme = "dark";
    };

    services = [
      {
        "Groupe 1" = [
          {
            "Jellyfin" = {
              description = "Système de média";
              href = "http://localhost:8096";
              icon = "jellyfin";
              widget = {
                type = "jellyfin";
                url = "http://localhost:8096";
                key = "5f56cbf7cf504105b8ba23e08eb1ffc6";
              };
            };
          }
          {
            "Calibre" = {
              description = "Biblothèque en ligne";
              href = "http://localhost:8083";
              icon = "calibre-web";
              #widget = {
              #  type = "calibreweb";
              #  url = "http://localhost:8083";
              #  username = "admin";
              #  password = "admin123";
              #};
            };
          }
          {
            "Deluge" = {
              description = "Qu'internet me le donne";
              href = "http://localhost:8112";
              icon = "deluge";
            };
          }
          {
            "Prowlarr" = {
              descrpition = "Indexing .arr";
              href = "http://localhost:9696";
              icon = "prowlarr";
              widget = {
                type = "prowlarr";
                url = "http://localhost:9696";
                key = "21124d60d2164799b75e4dd479832245";
              };
            };
          }
          {
            "Radarr" = {
              description = "Collection de film ultra légale";
              href = "http://localhost:7878";
              icon = "radarr";
              widget = {
                type = "radarr";
                url = "http://localhost:7878";
                api = "3d16602fe28a43f7915163aafcfd0d7a";
              };
            };
          }
          {
            "Sonnarr" = {
              description = "Collection de séries parfaitement légales";
              href = "http://localhost:8989";
              icon = "sonarr";
            };
          }
          {
            "Lidarr" = {
              description = "Collection de musique parfaitement légale";
              href = "http://localhost:8686";
              icon = "lidarr";
            };
          }
          {
            "Readarr" = {
              description = "Collection de livres parfaitement légales";
              href = "http://localhost:8787";
              icon = "readarr";
            };
          }
        ];
      }
    ];
  };
}