{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "SUPER,mouse:272,movewindow"
      "SUPER,mouse:273,resizewindow"
    ];
    bind = let
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
      #workspaces_key = [
      #  "quotedbl"
      #  "guillemotleft"
      #  "guillemotright"
      #  "parenleft"
      #  "parenright"
      #  "at"
      #  "plus"
      #  "minus"
      #  "slash"
      #  "asterisk"
      #  "equal"
      #  "percent"
      #  "F1"
      #  "F2"
      #  "F3"
      #  "F4"
      #  "F5"
      #  "F6"
      #  "F7"
      #  "F8"
      #  "F9"
      #  "F10"
      #  "F11"
      #  "F12"
      #];
      #workspaces = [
      #  "1"
      #  "2"
      #  "3"
      #  "4"
      #  "5"
      #  "6"
      #  "7"
      #  "8"
      #  "9"
      #  "0"
      #  "F1"
      #  "F2"
      #  "F3"
      #  "F4"
      #  "F5"
      #  "F6"
      #  "F7"
      #  "F8"
      #  "F9"
      #  "F10"
      #  "F11"
      #  "F12"
      #];
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
    in
      [
        "SUPERSHIFT,c,killactive"
        "SUPERSHIFT,x,exit"

        "SUPER,j,togglesplit"
        "SUPER,f,fullscreen,1"
        "SUPERSHIFT,f,fullscreen,0"
        "SUPERSHIFT,space,togglefloating"

        "SUPER,é,splitratio,-0.25"
        "SUPERSHIFT,é,splitratio,-0.3333333"

        "SUPER,è,splitratio,0.25"
        "SUPERSHIFT,è,splitratio,0.3333333"

        "SUPER,g,togglegroup"
        "SUPER,l,lockactivegroup,toggle"
        "SUPER,tab,changegroupactive,f"
        "SUPERSHIFT,tab,changegroupactive,b"

        "SUPER,apostrophe,workspace,previous"

        "SUPER,u,togglespecialworkspace"
        "SUPERSHIFT,u,movetoworkspacesilent,special"
        "SUPER,i,pseudo"
      ]
      ++
      # Change workspace
      (map (n: "SUPER,${n.key},workspace,name:${n.name}") workspaces)
      ++
      # Move window to workspace
      (map (n: "SUPERSHIFT,${n.key},movetoworkspacesilent,name:${n.name}") workspaces)
      ++
      # Move focus
      (lib.mapAttrsToList (key: direction: "SUPER,${key},movefocus,${direction}") directions)
      ++
      # Swap windows
      (lib.mapAttrsToList (key: direction: "SUPERSHIFT,${key},swapwindow,${direction}") directions)
      ++
      # Move windows
      (lib.mapAttrsToList (
          key: direction: "SUPERCONTROL,${key},movewindoworgroup,${direction}"
        )
        directions)
      ++
      # Move monitor focus
      (lib.mapAttrsToList (key: direction: "SUPERALT,${key},focusmonitor,${direction}") directions)
      ++
      # Move workspace to other monitor
      (lib.mapAttrsToList (
          key: direction: "SUPERALTSHIFT,${key},movecurrentworkspacetomonitor,${direction}"
        )
        directions);
  };
}
