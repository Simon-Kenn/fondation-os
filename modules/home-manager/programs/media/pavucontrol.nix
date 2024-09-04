{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.media.pavucontrol;
in {
  options.fdn.programs.media.pavucontrol = {
    enable = mkEnableOption "pavucontrol";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [pavucontrol];
  };
}
