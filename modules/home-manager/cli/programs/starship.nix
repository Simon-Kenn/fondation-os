{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.cli.programs.starship;
in {
  options.fdn.cli.programs.starship = {
    enable = mkEnableOption "starship";
  };

  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      catppuccin.enable = true;
    };
  };
}
