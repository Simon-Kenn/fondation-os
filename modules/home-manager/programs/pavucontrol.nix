{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.pavucontrol;
in {
  options.fdn.programs.pavucontrol = {
    enable = mkEnableOption "pavucontrol";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [pavucontrol];
  };
}
