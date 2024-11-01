{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.fdn.programs.wayland.hyprlock;
  inherit (config.fdn.themes) wallpaper;
in {
  options.fdn.programs.wayland.hyprlock = {
    enable = mkEnableOption "hyprlock";
  };

  config = mkIf cfg.enable {
    programs.hyprlock = {
      enable = true;
  
      settings = {
        general = {
          no_fade_in = true;
          grace = 1;
          disable_loading_bar = false;
          hide_cursor = true;
          ignore_empty_input = true;
          text_trim = true;
        };
  
        background = {
          path = "${wallpaper}";
          blur_passes = 2;
          contrast = 0.8916;
          brightness = 0.7172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0;
        };
  
        label = [
          {
            text = ''cmd[update:1000] echo -e "$(date +"%H")"'';
            # color = rgba(255, 255, 255, 1)
            color = "rgba(212, 131, 203, 0.9)";
            shadow_size = 3;
            shadow_color = "rgb(0,0,0)";
            shadow_boost = 1.2;
            font_size = 150;
            font_family = "AlfaSlabOne";
            position = "0, -250";
            halign = "center";
            valign = "top";
            zindex = 5;
          }
          {
            text = ''cmd[update:1000] echo -e "$(date +"%M")"'';
            # color = rgba(255, 255, 255, 1)
            color = "rgba(104,116,206,0.9)";
            font_size = 150;
            font_family = "AlfaSlabOne";
            position = "0, -420";
            halign = "center";
            valign = "top";
            zindex = 5;
          }
          {
            text = ''cmd[update:1000] echo -e "$(date +"%A, %d %b %Y")"'';
            # color = rgba(255, 255, 255, 1)
            color = "rgba(122,131,194,0.9)";
            font_size = 14;
            font_family = "JetBrains Mono Nerd Font Mono ExtraBold";
            position = "0, -130";
            halign = "center";
            valign = "center";
            zindex = 5;
          }
          {
            text = ''cmd[update:60000] echo "Good $(date +"%-I" | awk '{if ($1 < 12) 
              print "Bonjour"; else print "Bonsoir"}')'';
            color = "rgba(154,163,230,0.9)";
            font_size = 17;
            font_family = "JetBrains Mono Nerd Font Mono";
            position = "0, -250";
            halign = "center";
            valign = "center";
          }
        ];
  
        input-field = {
          size = "250 60";
          outline_thickness = 0;
          outer_color = "rgba(0, 0, 0, 0)";
          dots_size = 0.1; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 1; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          inner_color = "rgba(104,116,206,0.9)";
          font_color = "rgba(200, 200, 200, 0.5)";
          fade_on_empty = true;
          placeholder_text = "<i>Use Me ;) </i>";
          hide_input = false;
          position = "0 -370";
          halign = "center";
          valign = "center";
          zindex = 20;
        };
      };
    };
  };
}
