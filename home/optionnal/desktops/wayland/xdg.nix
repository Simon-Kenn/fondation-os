{
  config,
  ...
}: {
    xdg = {
      enable = true;
  
      mimeApps = {
        enable = true;
      };
  
      userDirs = {
        enable = true;
  
        documents = "${config.home.homeDirectory}/Documents";
        download = "${config.home.homeDirectory}/Téléchargements";
        music = "${config.home.homeDirectory}/Musiques";
        pictures = "${config.home.homeDirectory}/Images";
        videos = "${config.home.homeDirectory}/Vidéos";
  
        extraConfig = {
          XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Captures";
        };
      };
    };
}
