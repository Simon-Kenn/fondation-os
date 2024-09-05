{lib, ...}: let
  inherit (lib) types mkOption;
in {
  options.fdn.themes.wallpaper = mkOption {
    type = types.path;
    default = "";
    description = ''
      Wallpaper path
    '';
  };
}
