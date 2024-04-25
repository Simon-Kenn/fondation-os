{
  services.calibre-web = {
    enable = true;
    user = "leto";

    options = {
      calibreLibrary = "/home/leto/Bibliothèque";
    };
  };

  environment.persistence."/persist" = {
    directories = [
      "/var/lib/calibre-web"
    ];
  };
}
