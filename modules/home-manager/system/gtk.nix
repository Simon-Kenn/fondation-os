{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.system.gtk;
in {
  options.fdn.system.gtk = {
    enable = mkEnableOption "gtk";
  };

  config = mkIf cfg.enable {
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

  };
}
