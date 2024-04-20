{
  lib,
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    bind = let
      grimblast = lib.getExe pkgs.grimblast;
      terminal = config.home.sessionVariables.TERMINAL;

      defaultApp = type: "${lib.getExe' pkgs.gtk3 "gtk-launch"} $(${lib.getExe' pkgs.xdg-utils "xdg-mime"} query default ${type})";
      browser = defaultApp "x-scheme-handler/https";
    in [
      # Program bindings
      "SUPER,Return,exec, ${terminal}"
      "SUPER,b,exec, ${browser}"

      "SUPER,space,exec,wofi -S drun"
      "SUPER,h,exec,wofi -S run"
      "SUPER,l,exec,swaylock --grace 0 --fade-in 0"

      # Screenshooting
      ",print,exec,${grimblast} --notify --freeze copy output"
      "SUPER,print,exec,${grimblast} --notify --freeze copy area"
    ];
  };
}
