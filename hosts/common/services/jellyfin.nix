{
  services.jellyfin = {
    enable = true;

    user = "leto";
  };

  environment.persistence."/persist" = {
    directories = [
      "/var/lib/jellyfin"
    ];
  };
}
