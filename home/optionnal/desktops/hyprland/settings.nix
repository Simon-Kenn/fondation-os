{  config, pkgs, ...}: let
 inherit (config.colorscheme) palette;
in {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    env = [
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
    ];

    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 1;
      "col.active_border" = "0xaa${palette.base0D}";
      "col.inactive_border" = "0xaa${palette.base01}";

      allow_tearing = true;
      resize_on_border = true;
    };
  };

}
