{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.services.media.playerctl;
in {
  options.fdn.services.media.playerctl = {
    enable = mkEnableOption "service playerctl";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [playerctl];
    services.playerctld = {
      enable = true;
    };
  };
}
