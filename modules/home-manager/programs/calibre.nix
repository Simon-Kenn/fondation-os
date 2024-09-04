{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.programs.calibre;
in {
  options.fdn.programs.calibre = {
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
