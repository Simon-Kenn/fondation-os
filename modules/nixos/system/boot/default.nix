{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.system.boot;
in {
  options.fdn.system.boot = {
    enable = mkEnableOption "Enable system boot";
    plymouth = mkEnableOption "Enable plymouth boot";
  };

  config = mkIf cfg.enable {
    boot = {
      loader = {
        systemd-boot = {
          enable = true;
          consoleMode = "max";
        };
        efi.canTouchEfiVariables = true;
      };

      plymouth = {
        enable = cfg.plymouth;
        catppuccin.enable = true;
      };

      kernelParams = lib.optionals cfg.plymouth [
        "quiet"
        "systemd-show_status=auto"
        "rd.udev.log_level=3"
      ];
    };
  };
}
