{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.hardware.video;
in {
  options.fdn.hardware.video = {
    enable = mkEnableOption "Enable audio";
  };

  config = mkIf cfg.enable {
    hardware = {
      opengl = {
        enable = true;
        extraPackages = with pkgs; [
          mesa
        ];
        driSupport = true;
        driSupport32Bit = true;
      };
    };

    programs.dconf.enable = true;
  };
}
