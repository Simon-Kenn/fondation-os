{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.cli.programs.fd;
in {
  options.fdn.cli.programs.fd = {
    enable = mkEnableOption "fd";
  };

  config = mkIf cfg.enable {
    programs.fd = {
      enable = true;
    };
  };
}
