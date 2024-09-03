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

    decoration = {
      rounding = 16;
      blur = {
        enabled = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.01;

        vibrancy = 0.2;
        vibrancy_darkness = 0.5;

        passes = 4;
        size = 7;

        popups = true;
        popups_ignorealpha = 0.2;
      };

      drop_shadow = true;
      shadow_ignore_window = true;
      shadow_offset = "0 15";
      shadow_range = 100;
      shadow_render_power = 2;
      shadow_scale = 0.97;
      "col.shadow" = "rgba(00000055)";
    };
  };

}
