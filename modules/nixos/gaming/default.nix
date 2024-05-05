{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.gaming;
in {
  options.fdn.gaming = {
    enable = mkEnableOption "Enable gaming software";
  };

  config = mkIf cfg.enable {
    hardware.steam-hardware.enable = true;
    programs.gamemode = {
      enable = true;
      settings = {
        general = {
          softrealtime = "on";
          inhibit_screensaver = 1;
        };
      };
    };
  };
}
