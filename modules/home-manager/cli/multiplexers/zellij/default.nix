{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.cli.multiplexers.zellij;
in {
  options.fdn.cli.multiplexers.zellij = {
    enable = mkEnableOption "zellij";
  };

  config = mkIf cfg.enable {
    programs.zellij = {
      enable = true;
      catppuccin.enable = true;
      enableFishIntegration = true;
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

  };
}
