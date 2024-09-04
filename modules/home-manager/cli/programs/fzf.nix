{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.cli.programs.fzf;
in {
  options.fdn.cli.programs.fzf = {
    enable = mkEnableOption "fzf";
  };

  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;
      catppuccin.enable = true;
    };
  };
}
