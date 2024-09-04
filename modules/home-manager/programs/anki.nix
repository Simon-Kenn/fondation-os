{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.anki;
in {
  options.fdn.programs.anki = {
    enable = mkEnableOption "anki";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      anki-bin
    ];

    home.persistence."/persist/home/leto".directories = [
      ".local/share/Anki2"
    ];
  };
}
