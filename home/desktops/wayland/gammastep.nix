{
  services.gammastep = {
    enable = true;
    enableVerboseLogging = true;
    provider = "geoclue2";
    temperature = {
      day = 6000;
      night = 4600;
    };
    settings = {
      general.adjustement-method = "wayland";
    };
  };
}
