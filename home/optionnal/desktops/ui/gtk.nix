{pkgs, ...}: {
  gtk = {
    enable = true;
    font = {
      name = "Fira Sans";
      size = 12;
    };

    catppuccin = {
      enable = true;
      icon = {
        enable = true;
      };
    };
  };

  home.sessionVariables.GTK_THEME = "Adwaita-dark";
}
