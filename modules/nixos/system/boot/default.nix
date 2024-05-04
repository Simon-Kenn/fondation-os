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
        theme = "catppuccin-mocha";
        themePackages = [(pkgs.catppuccin-plymouth.override {variant = "mocha";})];
      };

      loader.timeout = 0;
      kernelParams = lib.optionals cfg.plymouth [
        "quiet"
        "loglevel=3"
        "systemd-show_status=auto"
        "rd.udev.log_level=3"
        "vt.global_cursor_default=0"
      ];

      consoleLogLevel = 0;
      initrd.verbose = false;
    };
  };
}
