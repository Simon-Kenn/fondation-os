{  config, pkgs, ...}: let
 inherit (config.colorscheme) palette;
in {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    env = [
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
    ];

    exec-once = [
      "${pkgs.waybar}/bin/waybar"
      "${pkgs.mako}/bin/mako"
    ];

    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 2;
      "col.active_border" = "0xaa${palette.base0D}";
      "col.inactive_border" = "0xaa${palette.base01}";

      allow_tearing = true;
      resize_on_border = true;
    };

    input = {
      kb_layout = "fr";
      kb_variant = "bepo";
      kb_options = "caps:swapescape";

      follow_mouse = 1;
      accel_profile = "flat";
      sensitivity = 0;

      touchpad = {
        natural_scroll = true;
        scroll_factor = 0.1;
      };
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
    };

    dwindle = {
      # keep floating dimentions while tiling
      pseudotile = true;
      preserve_split = true;
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

    animations = {
      enabled = true;

      bezier = [
        "easein,0.11, 0, 0.5, 0"
        "easeout,0.5, 1, 0.89, 1"
        "easeinback,0.36, 0, 0.66, -0.56"
        "easeoutback,0.34, 1.56, 0.64, 1"
      ];

      animation = [
        "windowsIn,1,3,easeoutback,slide"
        "windowsOut,1,3,easeinback,slide"
        "windowsMove,1,3,easeoutback"
        "workspaces,1,2,easeoutback,slide"
        "fadeIn,1,3,easeout"
        "fadeOut,1,3,easein"
        "fadeSwitch,1,2,easeout"
        "fadeShadow,1,3,easeout"
        "fadeDim,1,3,easeout"
        "border,1,3,easeout"
      ];
    };

    group = {
      groupbar = {
        font_size = 10;
        gradients = false;
        text_color = "0xaa${palette.base05}";
      };

      "col.border_active" = "0xaa${palette.base0D}";
      "col.border_inactive" = "0xaa${palette.base01}";
    };
  };

}
