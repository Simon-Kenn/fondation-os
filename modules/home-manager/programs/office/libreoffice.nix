{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.office.libre-office;
in {
  options.fdn.programs.office.libre-office = {
    enable = mkEnableOption "libre-office";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice-qt
      hunspell
      hunspellDicts.fr-moderne
    ];
  };
}
