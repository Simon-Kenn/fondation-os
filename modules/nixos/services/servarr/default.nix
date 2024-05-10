{
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
}
