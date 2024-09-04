{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.cli.programs.duf;
in {
  options.fdn.cli.programs.duf = {
    enable = mkEnableOption "duf";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      duf
    ];
  };
}
