{
  lib,
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    bind = let
      grimblast = lib.getExe pkgs.grimblast;
      #pactl = lib.getExe' pkgs.tesseract;
      tesseract = lib.getExe pkgs.tesseract;
      notify-send = lib.getExe' pkgs.libnotify "notify-send";

      terminal = config.home.sessionVariables.TERMINAL;
      defaultApp = type: "${lib.getExe' pkgs.gtk3 "gtk-launch"} $(${lib.getExe' pkgs.xdg-utils "xdg-mime"} query default ${type})";
      browser = defaultApp "x-scheme-handler/https";
    in
      [
        # Program bindings
        #"SUPER,Return,exec, ${terminal}"
        #"SUPER,b,exec, ${browser}"

        ## Screenshooting
        #",print,exec,${grimblast} --notify --freeze copysave area"
        #"SUPER,print,exec,${grimblast} --notify --freeze save output"
        ## To OCR
        #"ALT,Print,exec,${grimblast} --freeze save area - | ${tesseract} - - | wl-copy && ${notify-send} -t 3000 'OCR result copied to buffer'"

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
      #++ (
      #  let
      #    hyprlock = lib.getExe config.programs.hyprlock.package;
      #  in
      #    lib.optionals config.programs.hyprlock.enable [
      #      "SUPER,l,exec,${hyprlock}"
      #    ]
      #)
      #++
      ## Notification manager
      #(
      #  let
      #    makoctl = lib.getExe' config.services.mako.package "makoctl";
      #  in
      #    lib.optionals config.services.mako.enable ["SUPER,w,exec,${makoctl} dismiss"]
      #)
      #++
      ## Launcher
      #(
      #  let
      #    wofi = lib.getExe config.programs.wofi.package;
      #  in
      #    lib.optionals config.programs.wofi.enable [
      #      "SUPER,space,exec,${wofi} -S drun -x 10 -y 10 -W 25% -H 60%"
      #      "SUPER,h,exec,${wofi} -S run"
      #    ]
      #);
  };
}
