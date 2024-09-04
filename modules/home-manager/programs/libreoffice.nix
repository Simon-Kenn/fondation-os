{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.programs.libre-office;
in {
  options.fdn.programs.libre-office = {
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
