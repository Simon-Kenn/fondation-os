{  lib, pkgs, config, ...}: let 
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

      runOnce = program:  "pgrep ${program} || ${program}";

in {
  wayland.windowManager.hyprland.settings = {

    bindm = [
      "$mod,mouse:272,movewindow"
      "$mod,mouse:273,resizewindow"
    ];

    bind = let  
      grimblast = lib.getExe pkgs.grimblast;
      pactl = lib.getExe' pkgs.tesseract;
      notify-send = lib.getExe' pkgs.libnotify "notify-send";
      terminal = config.home.sessionVariables.TERMINAL;
      defaultApp = type: "${lib.getExe' pkgs.gtk3 "gtk-launch"} $(${lib.getExe' pkgs.xdg-utils "xdg-mime"} query default ${type})";
      browser = defaultApp "x-scheme-handler/https";

    in[
      # compositor command
      # ------------------

      "$mod SHIFT, c, killactive"
      "$mod SHIFT, Q, exit"

      "$mod, j, togglesplit"
      "$mod, f, fullscreen, 1"
      "$mod SHIFT, f, fullscreen, 0"
      "$mod SHIFT, space, togglefloating"

      "$mod, é, splitratio,-0.25"
      "$mod SHIFT, é, splitratio, -0.3333333"

      "$mod, è, splitratio, 0.25"
      "$mod SHIFT, è, splitratio, 0.3333333"

      "$mod, g, togglegroup"
      "$mod, l, lockactivegroup, toggle"
      "$mod, tab, changegroupactive, f"
      "$mod SHIFT, tab, changegroupactive, b"

      "$mod, apostrophe, workspace, previous"

      "$mod, u, togglespecialworkspace"
      "$mod SHIFT, u, movetoworkspacesilent, special"
      "$mod, i, pseudo"

      # programs
      #---------

      "$mod, Return, exec, ${terminal}"
      "$mod, b, exec, ${browser}"
      "$mod, l, exec, pgrep hyprlock || hyprlock"
      "$mod, w, exec, makoctl dismiss"
      "$mod, space, exec, wofi -S drun -x 10 -y 10 -W 25% -H 60%"
      "$mod, h, exec, wofi -S run"

      # Screenshot
      # ----------

      # area
      ", Print, exec, ${runOnce "grimblast"} --notify copysave area"
      "$mod SHIFT, R, exec, ${runOnce "grimblast"} --notify copysave area"

      # current screen
      "CTRL, Print, exec, ${runOnce "grimblast"} --notify --cursor copysave output"
      "$mod SHIFT CTRL, R, exec, ${runOnce "grimblast"} --notify --cursor copysave output"

      # all screens
      "ALT, Print, exec, ${runOnce "grimblast"} --notify --cursor copysave screen"
      "$mod SHIFT ALT, R, exec, ${runOnce "grimblast"} --notify --cursor copysave screen"
    ]
    ++
    # Change workspace
    (map (n: "$mod, ${n.key}, workspace, name:${n.name}") workspaces)
    ++
    # Move window to workspace
    (map (n: "$mod SHIFT, ${n.key}, movetoworkspacesilent, name:${n.name}") workspaces)
    ++
    # Move focus
    (lib.mapAttrsToList (key: direction: "$mod, ${key}, movefocus, ${direction}") directions)
    ++
    # Swap windows
    (lib.mapAttrsToList (key: direction: "$mod SHIFT, ${key}, swapwindow, ${direction}") directions)
    ++
    # Move windows
    (lib.mapAttrsToList (
        key: direction: "$mod CONTROL, ${key}, movewindoworgroup, ${direction}"
      )
      directions)
    ++
    # Move monitor focus
    (lib.mapAttrsToList (key: direction: "$mod ALT, ${key}, focusmonitor, ${direction}") directions)
    ++
    # Move workspace to other monitor
    (lib.mapAttrsToList (
        key: direction: "$mod ALTSHIFT,${key}, movecurrentworkspacetomonitor,${direction}"
      )
      directions);

    bindl = [
      # media controls
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioNext, exec, playerctl next"

      # volume
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ];

    bindle = [
      # volume
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"

      # backlight
      ", XF86MonBrightnessUp, exec, brillo -q -u 300000 -A 5"
      ", XF86MonBrightnessDown, exec, brillo -q -u 300000 -U 5"
    ];
  };
}
