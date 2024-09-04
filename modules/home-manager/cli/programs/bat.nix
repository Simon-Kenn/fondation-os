{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.cli.programs.bat;
in {
  options.fdn.cli.programs.bat = {
    enable = mkEnableOption "bat";
  };

  config = mkIf cfg.enable {
    programs.bat = {
      enable = true;
      catppuccin.enable = true;
    };
  };
}
