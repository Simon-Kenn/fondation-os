{
  config,
  lib,
  pkgs,
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
        name = "Inter";
        package = pkgs.google-fonts.override {fonts = ["Inter"];};
        size = 9;
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
