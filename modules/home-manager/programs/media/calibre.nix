{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.media.calibre;

  custom_mech = pkgs.python311Packages.mechanize.overridePythonAttrs
    (old: { doCheck = false; });
  custom_calibre = pkgs.calibre.override (old: {
    python3Packages = old.python3Packages // { mechanize = custom_mech; };
  });
in {
  options.fdn.programs.media.calibre = {
    enable = mkEnableOption "calibre";
  };

  config = mkIf cfg.enable {
    home.packages = [
      custom_calibre
    ];

    home.persistence."/persist/home/leto".directories = [
      ".config/calibre"
    ];
  };
}
