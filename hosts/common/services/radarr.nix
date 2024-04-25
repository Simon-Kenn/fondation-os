{
  services.radarr = {
    enable = true;

    user = "leto";
  };

  environment.persistence."/persist" = {
    directories = [
      "/var/lib/radarr"
    ];
  };
}
