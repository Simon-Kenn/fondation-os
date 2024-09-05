{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.services.wayland.gammastep;
in {
  options.fdn.services.wayland.gammastep = {
    enable = mkEnableOption "gammastep";
  };

  config = mkIf cfg.enable {
    services.gammastep = {
      enable = true;
      enableVerboseLogging = true;
      provider = "geoclue2";
      temperature = {
        day = 6000;
        night = 4600;
      };
      settings = {
        general.adjustement-method = "wayland";
      };
    };

  };
}
