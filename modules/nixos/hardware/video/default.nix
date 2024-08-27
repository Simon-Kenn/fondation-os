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
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [intel-media-sdk];
      };
    };

    programs.dconf.enable = true;
  };
}
