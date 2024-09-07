{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.cli.programs.eza;
in {
  options.fdn.cli.programs.eza = {
    enable = mkEnableOption "eza";
  };

  config = mkIf cfg.enable {
    programs.eza = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
