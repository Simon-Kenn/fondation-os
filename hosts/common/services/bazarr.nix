{
  services.bazarr = {
    enable = true;
  };

  environment.persistence."/persist" = {
    directories = [
      "/var/lib/bazarr"
    ];
  };
}
