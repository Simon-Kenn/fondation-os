{
  services.readarr = {
    enable = true;
  };

  environment.persistence."/persist" = {
    directories = [
      "/var/lib/readarr"
    ];
  };
}
