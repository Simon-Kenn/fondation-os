{
  programs.zellij = {
    enable = true;
    catppuccin.enable = true;
  };

  xdg.configFile = {
    "zellij/config.kdl".source = ./config.kdl;
    "zellij/layouts/mine.kdl".text = ''
      layout {
      	pane size=1 borderless=true {
      		plugin location="zellij:compact-bar"
      	}
      	pane
      }
    '';
  };
}
