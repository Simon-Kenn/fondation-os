{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.hm.desktops.wayland.swaync;
in {
  options.hm.desktops.wayland.swaync = {
    enable = mkEnableOption "Enable sway notification center";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      swaynotificationcenter
    ];

    xdg.configFile."swaync/style.css".source = ./swaync.css;
    xdg.configFile."swaync/config.json".source = ./swaync.json;
  };
}


