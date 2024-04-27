{
  i18n = {
    defaultLocale = "fr_FR.UTF-8";
  };
  time.timeZone = "Europe/Paris";

  services.xserver.xkb = {
    layout = "fr";
    variant = "bepo";
  };

  console = {
    keyMap = "fr-bepo";
    catppuccin.enable = true;
  };
}
