{pkgs, ...}: {
  gtk = {
    enable = true;
    font = {
      name = "Fira Sans";
      size = 12;
    };

    catppuccin = {
      enable = true;
      cursor = {
        enable = true;
      };
    };

    #iconTheme = {
    #  package = pkgs.catppuccin-papirus-folders.override {
    #    flavor = "mocha";
    #    accent = "lavender";
    #  };
    #  name = "Papirus-Dark";
    #};
  };

  home.sessionVariables.GTK_THEME = "Adwaita-dark";
  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
  };
}
