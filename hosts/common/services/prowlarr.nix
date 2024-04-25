{
  services.prowlarr = {
    enable = true;
  };

  environment.persistence."/persist" = {
    directories = [
      "/var/lib/private/prowlarr"
    ];
  };
}
