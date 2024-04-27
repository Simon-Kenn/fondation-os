{
  programs.zellij = {
    enable = true;
    catppuccin.enable = true;
  };

  xdg.configFile = {
    "zellij/config.kdl".source = ./config.kdl;
  };
}
