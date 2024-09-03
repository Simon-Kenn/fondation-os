{  lib, ...}: let 
      workspaces = [
        {
          name = "1";
          key = "quotedbl";
        }
        {
          name = "2";
          key = "guillemotleft";
        }
        {
          name = "3";
          key = "guillemotright";
        }
        {
          name = "4";
          key = "parenleft";
        }
        {
          name = "5";
          key = "parenright";
        }
        {
          name = "7";
          key = "at";
        }
        {
          name = "8";
          key = "plus";
        }
        {
          name = "9";
          key = "minus";
        }
        {
          name = "10";
          key = "slash";
        }

        {
          name = "11";
          key = "asterisk";
        }
        {
          name = "12";
          key = "equal";
        }
        {
          name = "13";
          key = "percent";
        }
        {
          name = "F1";
          key = "F1";
        }
        {
          name = "F2";
          key = "F2";
        }
        {
          name = "F3";
          key = "F3";
        }
        {
          name = "F4";
          key = "F4";
        }
        {
          name = "F5";
          key = "F5";
        }
        {
          name = "F6";
          key = "F6";
        }
        {
          name = "F7";
          key = "F7";
        }
        {
          name = "F8";
          key = "F8";
        }
        {
          name = "F9";
          key = "F9";
        }
        {
          name = "F10";
          key = "F10";
        }
        {
          name = "F11";
          key = "F11";
        }
        {
          name = "F12";
          key = "F12";
        }
      ];

      directions = rec {
        left = "l";
        right = "r";
        up = "u";
        down = "d";
        t = left;
        n = right;
        r = up;
        s = down;
      };

in {
  wayland.windowManager.hyprland.settings = {

    bindm = [
      "$mod,mouse:272,movewindow"
      "$mod,mouse:273,resizewindow"
    ];

  };
}
