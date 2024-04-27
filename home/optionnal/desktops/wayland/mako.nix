{config, ...}: let
  inherit (config.colorscheme) palette variant;
in {
  services.mako = {
    enable = true;
    catppuccin.enable = true;
    iconPath =
      if variant == "dark"
      then "${config.gtk.iconTheme.package}/share/icons/Papirus-Dark"
      else "${config.gtk.iconTheme.package}/share/icons/Papirus-Light";
    font = "${config.fontProfiles.regular.family} 12";
    padding = "10,20";
    anchor = "top-center";
    width = 400;
    height = 150;
    borderSize = 2;
    defaultTimeout = 12000;
    layer = "overlay";
  };
}