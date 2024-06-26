{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    grimblast
    wev
  ];

  wayland.windowManager.hyprland = {
    settings = let
      active = "0xaa${config.colorscheme.palette.base0C}";
      inactive = "0xaa${config.colorscheme.palette.base02}";
    in {
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        resize_on_border = true;
        hover_icon_on_border = true;
        "col.active_border" = active;
        "col.inactive_border" = inactive;
      };

      decoration = {
        rounding = 5;

        active_opacity = 0.97;
        inactive_opacity = 0.77;
        fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          popups = true;
        };

        drop_shadow = "yes";
        shadow_range = 12;
        shadow_offset = "3 3";
        "col.shadow" = "0x44000000";
        "col.shadow_inactive" = "0x66000000";
      };

      input = {
        kb_layout = "fr";
        kb_variant = "bepo";
        kb_options = "caps:swapescape";

        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = true;
      };

      group = {
        groupbar.font_size = 11;
        "col.border_active" = active;
        "col.border_inactive" = inactive;
      };

      exec = ["${pkgs.swaybg}/bin/swaybg -i ${config.wallpaper} --mode fill"];

      exec-once = [
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.mako}/bin/mako"
        "${pkgs.kanshi}/bin/kanshi"
      ];

      dwindle = {
        pseudotile = true;
        preserve_split = "yes";
      };

      misc.vfr = "on";

      master = {
        new_is_master = true;
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
    };
  };
  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    MOW_ENABLE_WAYLAND = 1;
  };
}
