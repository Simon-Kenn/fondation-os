{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.fdn.env.core;
in {
  imports = [];

  options.fdn.env.core = {
    enable = mkEnableOption "Enable core environment";
  };

  config =
    mkIf cfg.enable {
    };
}
