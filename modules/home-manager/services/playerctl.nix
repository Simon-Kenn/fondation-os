{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.services.playerctl;
in {
  options.fdn.services.playerctl = {
    enable = mkEnableOption "service playerctl";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [playerctl];
    services.playerctld = {
      enable = true;
    };
  };
}
