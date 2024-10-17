{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.services.wayland.hyprpaper;
  inherit (config.fdn.themes) wallpaper;
in {
  options.fdn.services.wayland.hyprpaper = {
    enable = mkEnableOption "hyprpaper";
  };

  config = mkIf cfg.enable {
    services.hyprpaper = {
      enable = true;

      settings = {
        preload = ["${wallpaper}"];
        wallpapers = [",${wallpaper}"];
      };
    };

  };
}
