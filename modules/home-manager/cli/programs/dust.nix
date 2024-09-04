{
  config,
  lib,
  dust,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.cli.programs.dust;
in {
  options.fdn.cli.programs.dust = {
    enable = mkEnableOption "dust";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      dust
    ];
  };
}
