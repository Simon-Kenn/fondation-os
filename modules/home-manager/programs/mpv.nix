{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.programs.mpv;
in {
  options.fdn.programs.mpv = {
    enable = mkEnableOption "mpv";
  };

  config = mkIf cfg.enable {
    programs.mpv = {
      enable = true;
      catppuccin.enable = true;
    };
  };
}
