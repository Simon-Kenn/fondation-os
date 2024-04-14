{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.hm.desktops.ui.qt;
in {
  options.hm.desktops.ui.qt = {
    enable = mkEnableOption "enable qt theme management";
  };

  config = mkIf cfg.enable {
    qt = {
      enable = true;
      platformTheme = "gtk";
      style = {
        name = "adwaita-dark";
        package = pkgs.adwaita-qt;
      };
    };
  };
}
