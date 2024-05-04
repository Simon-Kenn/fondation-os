{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.fdn.system.locale;
in {
  options.fdn.system.locale = {
    enable = mkEnableOption "Enable console";
  };

  config = mkIf cfg.enable {
    i18n = {
      defaultLocale = "fr_FR.UTF-8";
    };
    time.timeZone = "Europe/Paris";

    console = {
      keyMap = "fr-bepo";
      catppuccin.enable = true;
    };
  };
}
