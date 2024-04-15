{ lib, ...}: let
  inherit (lib) types mkOption;
in {
  options.hm.desktops.ui.wallpaper = mkOption {
    type = types.path;
    default = "";
    description = ''
      Wallpaper path
    '';
  };
}
