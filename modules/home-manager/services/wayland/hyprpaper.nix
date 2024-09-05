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
      package = inputs.hyprpaper.packages.${pkgs.system}.default;
  
      settings = {
        preload = ["${wallpaper}"];
        wallpapers = [",${wallpaper}"];
      };
    };

  };
}
