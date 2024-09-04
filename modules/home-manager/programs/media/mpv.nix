{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.programs.media.mpv;
in {
  options.fdn.programs.media.mpv = {
    enable = mkEnableOption "mpv";
  };

  config = mkIf cfg.enable {
    programs.mpv = {
      enable = true;
      catppuccin.enable = true;
    };
  };
}
