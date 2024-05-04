{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.hardware.bluetooth;
in {
  options.fdn.hardware.bluetooth = {
    enable = mkEnableOption "Enable bluetooth";
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
