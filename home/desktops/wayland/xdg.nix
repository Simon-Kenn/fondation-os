{
  pkgs,
  config,
  ...
}: {
  xdg = {
    enable = true;
    #autostart.enable = true;
    portal = {
      enable = true;
      config = {
        common = {
          default = [
            "gtk"
          ];
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
      ];
    };

    mimeApps = {
      enable = true;
    };

    userDirs = {
      enable = true;
      #createDirectories = true;

      #desktop = "";
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
