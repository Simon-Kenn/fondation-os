{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.services.wayland.mako;
in {
  options.fdn.services.wayland.mako = {
    enable = mkEnableOption "mako";
  };

  config = mkIf cfg.enable {
    services.mako = {
      enable = true;
      catppuccin.enable = true;
      iconPath = "${config.gtk.iconTheme.package}/share/icons/Papirus-Dark";
      font = "${config.fontProfiles.regular.family} 12";
      padding = "10,20";
      anchor = "top-center";
      width = 400;
      height = 150;
      borderSize = 2;
      defaultTimeout = 12000;
      layer = "overlay";
    };

  };
}
