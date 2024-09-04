{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.cli.programs.ripgrep;
in {
  options.fdn.cli.programs.ripgrep = {
    enable = mkEnableOption "ripgrep";
  };

  config = mkIf cfg.enable {
    programs.ripgrep = {
      enable = true;
    };
  };
}
