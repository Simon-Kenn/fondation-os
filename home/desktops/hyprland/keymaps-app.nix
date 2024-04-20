{
  lib,
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    bind = let
      grimblast = lib.getExe pkgs.grimblast;
      pactl = lib.getExe' pkgs.tesseract;
      tesseract = lib.getExe pkgs.tesseract;
      notify-send = lib.getExe' pkgs.libnotify "notify-send";

      terminal = config.home.sessionVariables.TERMINAL;
      defaultApp = type: "${lib.getExe' pkgs.gtk3 "gtk-launch"} $(${lib.getExe' pkgs.xdg-utils "xdg-mime"} query default ${type})";
      browser = defaultApp "x-scheme-handler/https";
    in
      [
        # Program bindings
        "SUPER,Return,exec, ${terminal}"
        "SUPER,b,exec, ${browser}"

        "SUPER,space,exec,wofi -S drun"
        "SUPER,h,exec,wofi -S run"

        # Screenshooting
        ",print,exec,${grimblast} --notify --freeze copysave area"
        "SUPER,print,exec,${grimblast} --notify --freeze save output"
        # To OCR
        "ALT,Print,exec,${grimblast} --freeze save area - | ${tesseract} - - | wl-copy && ${notify-send} -t 3000 'OCR result copied to buffer'"

        ## Brightness control (only works if the system has lightd)
        #",XF86MonBrightnessUp,exec,light -A 10"
        #",XF86MonBrightnessDown,exec,light -U 10

        # TODO: end it
        # Volume
        #",XF86AudioRaiseVolume,exec,${pactl} set-sink-volume @DEFAULT_SINK@ +5%"
        #",XF86AudioLowerVolume,exec,${pactl} set-sink-volume @DEFAULT_SINK@ -5%"
        #",XF86AudioMute,exec,${pactl} set-sink-mute @DEFAULT_SINK@ toggle"
        #"SHIFT,XF86AudioMute,exec,${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
        #",XF86AudioMicMute,exec,${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
      ]
      # Screen lock
      ++ (
        let
          swaylock = lib.getExe config.programs.swaylock.package;
        in
          lib.optionals config.programs.swaylock.enable [
            "SUPER,l,exec,${swaylock} -S --grace 2"
          ]
      )
      ++
      # Notification manager
      (
        let
          makoctl = lib.getExe' config.services.mako.package "makoctl";
        in
          lib.optionals config.services.mako.enable ["SUPER,w,exec,${makoctl} dismiss"]
      );
  };
}
