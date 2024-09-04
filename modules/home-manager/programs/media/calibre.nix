{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.media.calibre;
in {
  options.fdn.programs.media.calibre = {
    enable = mkEnableOption "calibre";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      calibre 
    ];

    home.persistence."/persist/home/leto".directories = [
      ".config/calibre"
    ];
  };
}
