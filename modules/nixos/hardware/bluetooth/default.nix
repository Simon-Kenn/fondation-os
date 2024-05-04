{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.hardware.video;
in {
  options.fdn.hardware.video = {
    enable = mkEnableOption "Enable video";
  };

  config = mkIf cfg.enable {
    services.blueman.enable = true;
    hardware = {
      bluetooth = {
        enable = true;
        powerOnBoot = false;
        settings = {
          General = {
            Experimental = true;
          };
        };
      };
    };
  };
}
